<?php
namespace App\Http\Controllers\Site;

use App\Models\Page;
use App\Models\PageCategory;
use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Response;

class PagesController extends SiteController {

    public function showHome()
    {
        $featuredPages = Page::with('category')->featured(app()->getLocale())->get();
        
//        $latestCategories = ProductCategory::take('4')->orderBy('id', 'asc')->get();
        $featuredPackages = Product::whereStatus('featured')->take('6')->get();

    $Packages = Page::featured(app()->getLocale())->get()->take('4');
    $veaturedPages = Page::inactive(app()->getLocale())->take('4')->get();
//        $homePage = Page::with('category')->status('home')->first();
//
//        if(is_null($homePage))
//            return redirect()->route('control.panel.home', config('control_panel.default_locale'));
//
//        $content = $homePage->render();

        return view('site.home', compact('featuredPackages','featuredPages','Packages','veaturedPages'));
    }

    public function showCatalog()
    {
        return Response::make(file_get_contents(PDF_PATH.$this->misc->catalog_pdf), 200, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename="'.trans('labels.catalog_factory').'"'
        ]);
    }

    public function showCategory($path)
    {
        $path = explode('/', $path);
        $slug = array_pop($path);

        $category = PageCategory::where([
            'slug' => $slug,
            'path' => implode('/', $path) . '/'
        ])->first();

        if (is_null($category)) throw (new ModelNotFoundException())->setModel(PageCategory::class);

        $breadcrumb = [];

        $category->getAncestors()->map(function ($item) use (&$breadcrumb, $category) {
            $breadcrumb[] = [
                'label' => $item->name_locale,
                'link' => $item->fullurl(),
            ];
        });

        $breadcrumb[] = [
            'label' => $category->name_locale
        ];

        return view('site.category', [
            'category' => $category,
            'breadcrumb' => $breadcrumb
        ]);
    }

    public function showPage($full_path)
    {
        $full_path = explode('/', $full_path);

        if (count($full_path) > 1) {
            $page = $this->categorizedPage($full_path);
        } else {
            $page = $this->uncategorizedPage($full_path);
        }

        $content = $page->render();

        return view('site.page', [
            'page' => $page,
            'content' => $content,
        ]);
    }

    private function categorizedPage($full_path)
    {
        $pageSlug = array_pop($full_path);

        if (count($full_path) == 1) {
            $category = PageCategory::findBySlugOrFail($full_path[0]);
        } else {
            $category = PageCategory::where([
                'slug' => array_pop($full_path),
                'path' => implode('/', $full_path) . '/'
            ])->first();
        }

        $page = $category->pages()->where([
            'slug' => $pageSlug,
        ])->first();

        if (is_null($page)) throw (new ModelNotFoundException())->setModel(get_called_class());

        $page->load('category', 'icon', 'featuredImage');

        return $page;
    }

    private function uncategorizedPage($slug)
    {
        return Page::findBySlugOrFail($slug)->load('featuredImage', 'icon');
    }

    public function closed()
    {
        if ($this->misc->closing_status != 'closed')
            return redirect('site.home');

        return view('site.closed', [
            'message' => $this->misc->closing_message_locale
        ]);
    }

    public function showContactUs()
    {
        $latlng = json_decode($this->misc->google_map);

        return view('site.contact_us', [
            'map_options' => [
                'lat' => $latlng->lat,
                'lng' => $latlng->lng,
                'address' => $this->misc->address_locale,
                'company' => $this->misc->site_name_locale,
                'icon' => asset('assets/site/images/pin.png'),
            ]
        ]);
    }
    
        public function showbook()
    {
        return view('site.book');
    }

     public function showTransport()
        {
           
    
            return view('site.transport');
        }
    
    public function showProducts(){
        $products = product::get();

        $breadcrumb[] = [
            'label' => trans('labels.products')
        ];

        return view('site.packages', [
            'products' => $products,
            'breadcrumb' => $breadcrumb
        ]);
    }
}