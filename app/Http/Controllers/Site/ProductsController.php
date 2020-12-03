<?php
namespace App\Http\Controllers\Site;

use App\Models\City;
use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class ProductsController extends SiteController
{
    public function index($slug)
    {
        if(!$slug)
            return back();

        $products = Product::with('image')->whereHas('category', function($c) use($slug){
            $c->where('slug', $slug);
        });
        if(\Request::has('city') && \Request::get('city') > 0)
            $products->where('city_id', \Request::get('city'));

        $products = $products->paginate(6);

        $viewPath = 'site.products.packages';
        if(in_array($slug, ['tours', 'shore-excursions', 'compined-tours', 'daily-tours', 'cairo', 'luxor']))
            $viewPath = 'site.products.tours';
        elseif($slug == 'اكسسوارات')
            $viewPath = 'site.products.اكسسوارات';
        elseif($slug == 'مشاريعنا')
            $viewPath = 'site.products.مشاريعنا';

        $toursCities = City::has('products')->get();

        return view($viewPath, [
            'products'      => $products,
            'title'         => ProductCategory::whereSlug($slug)->first()->name_locale,
            'toursCities'   => $toursCities
        ]);
    }

    public function show($slug)
    {
        $product = Product::findBySlugOrFail($slug)->load('image');
        return view('site.products.product', ['product' => $product]);
    }

    public function category($slug)
    {
        $category = ProductCategory::with('featuredImage')->whereSlug($slug)->first();

        return view('site.products.category', ['category' => $category]);
    }
}