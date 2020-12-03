<?php

namespace App\Models;

use App\Blackburn\Traits\AddImageTrait;
use App\Blackburn\Traits\SlugifyTrait;
use App\Blackburn\Traits\LocalizedFieldsTrait;
use App\Blackburn\Traits\StatusAttributeTrait;

class Product extends BaseModel {

    use LocalizedFieldsTrait;
    use SlugifyTrait;
    use StatusAttributeTrait;
    use AddImageTrait;

    const IMAGE_WIDTH = 1024;
    const IMAGE_HEIGHT = null;

    protected $fillable = [];

    protected $table = 'products';

    protected function setFillableFields()
    {
        $fillable = ['slug', 'product_category_id', 'image_product', 'status'];

        foreach (config('site.locales') as $locale) {
            $fillable[] = 'name_' . $locale;
            $fillable[] = 'description_' . $locale;
            
        }

        $this->fillable = $fillable;
    }

    public static function getRules($input = [], $product = null)
    {
        $default_locale = config('site.default_locale');

        $rules = [
            'name_' . $default_locale => 'required|max:255',
        ];

        if (!$product || $product->slug != $input['slug']) {
            $rules['slug'] = 'required|unique:products,slug';

        }

        return $rules;
    }

    public function image()
    {
        return $this->belongsTo('App\Models\Image', 'image_product', 'id');
    }

    public function getImageColumn()
    {
        return 'image_product';
    }

    public function addImages($imagesList)
    {
        $ids = [];

        foreach ($imagesList as $uploadedImage) {
            $image = new Image();

            $image->upload($uploadedImage);

            if ($image->save()) $ids[] = $image->id;
        }

        $this->images()->attach($ids);
    }

    public function category()
    {
        return $this->belongsTo('App\Models\ProductCategory', 'product_category_id', 'id');
    }

    public function hasCategory()
    {
        return !empty($this->category);
    }

    public static function availableOrders()
    {
        $orders = [];

        foreach (siteLocales() as $locale) {
            $orders['title_' . $locale . ' asc'] = localizedLabel('title', $locale) . ' - ' . trans('labels.asc');
            $orders['title_' . $locale . ' desc'] = localizedLabel('title', $locale) . ' - ' . trans('labels.desc');
        }

        $orders['created_at' . ' desc'] = trans('labels.latest');

        return $orders;
    }

    public function fullPath($as_array = false)
    {
        $category = $this->category;
        $category_path = is_null($category) ? '' : $category->fullPath();

        $path =  $this->slug;

        if ($as_array) return explode('/', $path);

        return $path;
    }

    public function fullUrl($locale = null, $absolute = true)
    {
        if (count(siteLocales()) > 1) {
            $locale = '/' . (is_null($locale) ? app()->getLocale() : $locale);
        }

        $uri = $locale . '/products/' . $this->fullPath() . '.html';

        return $absolute ? url($uri) : $uri;
    }


    public function setFeaturesEnAttribute($value)
    {
        $this->attributes['features_en'] = json_encode($value);
    }

    public function setFeaturesEsAttribute($value)
    {
        $this->attributes['features_es'] = json_encode($value);
    }

    public function setFeaturesPtAttribute($value)
    {
        $this->attributes['features_pt'] = json_encode($value);
    }

   

}
