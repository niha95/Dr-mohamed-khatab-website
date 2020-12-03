<?php
namespace App\Blackburn\Filters;

class RequestFilters extends QueryFilters {

    public function categories($categories)
    {
        $categories = explode('~', $categories);

        if(in_array('uncategorized', $categories))
            return $this->builder->where('category', '');

        return $this->builder->whereIn('category', $categories);
    }

    public function categoriesStringify($categories)
    {
        $categories = explode('~', $categories);
        if(in_array('uncategorized', $categories))
            return trans('messages.only_uncategorized');

        return trans('messages.in_categories', ['categories' => implode(', ', $categories)]);
    }

    public function packages($packages)
    {
        $packages = explode('~', $packages);

        return $this->builder->whereIn('package', $packages);
    }

    public function packagesStringify($packages)
    {
        $packages = explode('~', $packages);

        return trans('messages.only_packages', ['packages' => implode(', ', $packages)]);
    }

    public function status($status)
    {
        return $this->builder->where('status', $status);
    }

    public function statusStringify($status)
    {
        return trans('messages.only_status', ['status' => trans('labels.statuses.' . $status)]);
    }
}