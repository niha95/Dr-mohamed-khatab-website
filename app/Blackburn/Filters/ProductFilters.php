<?php
namespace App\Blackburn\Filters;

use App\Models\ProductCategory;

class ProductFilters extends QueryFilters {

    public function categories($categories)
    {
        $ids = explode(' ', $categories);

        return $this->builder->whereIn('product_category_id', $ids);
    }

    public function categoriesStringify($categories)
    {
        $ids = explode(' ', $categories);

        $categories = ProductCategory::whereIn('id', $ids)->get();
        $categories = $categories->map(function ($item) {
            return $item['name_translated_piped'];
        });

        return trans('messages.in_categories', ['categories' => implode(', ', $categories->toArray())]);
    }

    public function keywords($keywords)
    {
        return $this->builder->where('name_' . defaultLocale(), 'like', '%' . $keywords . '%');
    }

    public function keywordsStringify($keywords)
    {
        return trans('messages.using_keywords', ['keywords' => $keywords]);
    }
}