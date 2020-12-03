<?php

namespace App\Models;

use App\Blackburn\Traits\AddImageTrait;
use App\Blackburn\Traits\SlugifyTrait;
use Illuminate\Database\Eloquent\Model;
use Kalnoy\Nestedset\NodeTrait;
use App\Blackburn\Traits\LocalizedFieldsTrait;

class ProductCategory extends BaseModel {

    use NodeTrait;
    use LocalizedFieldsTrait;
    use SlugifyTrait;
    use AddImageTrait;

    const IMAGE_WIDTH = 1024;
    const IMAGE_HEIGHT = null;

    protected $fillable = [];

    protected $table = 'products_categories';


    public function getImageColumn()
    {
        return 'featured_image_id';
    }

    public function featuredImage()
    {
        return $this->belongsTo('App\Models\Image', 'featured_image_id', 'id');
    }

    protected function setFillableFields()
    {
        $fillable = ['slug', 'parent_id', 'featured_image_id'];

        foreach (config('site.locales') as $locale) {
            $fillable[] = 'name_' . $locale;
        }

        $this->fillable = $fillable;
    }

    public static function getRules($input = [], $category = null)
    {
        $default_locale = config('site.default_locale');

        $rules = [
            'name_' . $default_locale => 'required|max:255',
        ];

        if (!$category || $category->slug != $input['slug']) {
            $rules['slug'] = 'required|unique:products_categories,slug';
        }

        return $rules;
    }

    public function products()
    {
        return $this->hasMany('App\Models\Product', 'product_category_id', 'id');
    }

    public function productsCountRelation()
    {
        return $this->hasOne('App\Models\Product')
            ->selectRaw('product_category_id, count(*) as count')
            ->groupBy('product_category_id');
    }

    public function getProductsCountAttribute()
    {
        if ($this->productsCountRelation) {
            return $this->productsCountRelation->count;
        }

        return 0;
    }

    public function fullPath()
    {
        return ($this->path == '/' ? '' : $this->path) . $this->slug . '/';
    }

    public function fullUrl($locale = null, $absolute = true)
    {
        $uri = '/' . $this->fullPath();

        return $absolute ? url($uri) : $uri;
    }

    public function generatePath()
    {
        $parent = $this->parent;

        $this->path = !is_null($parent) ? $parent->fullPath() : '/';
    }

    public function syncChildren()
    {
        if($this->isDirty('parent_id')) {
            $this->path = $this->parent()->first()->fullPath();
        }

        $children = $this->descendants->toTree();

        if($children->isEmpty()) return;

        $stmt = 'UPDATE products_categories SET `path` = (CASE ';
        $ids = [];

        $traverse = function ($categories, $prefix = '') use (&$traverse, &$stmt, &$ids) {
            if (empty($prefix)) $prefix = $this->fullPath();

            foreach ($categories as $category) {
                $stmt .= "WHEN `id` = {$category->id} THEN '{$prefix}' ";
                $ids[] = $category->id;

                $traverse($category->children, $prefix . $category->slug . '/');
            }
        };

        $traverse($children);

        $stmt .= 'ELSE `path` END) ';
        $stmt .= "WHERE id IN (" . implode(', ', $ids) . ")";

        \DB::statement($stmt);
    }

    public static function mappedList($withPlaceholder = true)
    {
        $default_locale = config('site.default_locale');

        $nodes = static::orderBy('name_' . $default_locale)->get()->toTree();


        if ($withPlaceholder) {
            $list = [
                0 => placeholderText(trans('labels.parent'))
            ];
        } else {
            $list = [];
        }


        $traverse = function ($categories, $prefix = '') use (&$traverse, &$list) {
            foreach ($categories as $category) {
                $list[$category->id] = $prefix . ' ' . $category->name_translated_piped;

                $traverse($category->children, $prefix . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
            }
        };

        $traverse($nodes);

        return $list;
    }

    public static function boot()
    {
        static::saving(function ($model) {
            $model->generatePath();
        });

        static::updating(function ($model) {
            if ($model->isDirty('slug') || $model->isDirty('parent_id')) {
                $model->syncChildren();
            }
        });

        parent::boot();
    }
}
