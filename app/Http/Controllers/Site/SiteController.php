<?php
namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\Models\MenuItem;
use App\Models\Misc;
use App\Models\Slide;

class SiteController extends Controller {

    protected $misc, $banner;

    protected $navbar = null;

    public function __construct()
    {
        \DB::enableQueryLog();

        $this->shareMisc();
        $this->shareCurrentLocale();

        $this->composeNavbar();

        $this->setCurrentNav();
        $this->getBanner();
    }

    private function shareMisc()
    {
        $this->misc = Misc::first();

        view()->share('misc', $this->misc);
    }

    private function shareCurrentLocale()
    {
        view()->share('currentLocale', app()->getLocale());
    }

    protected function composeNavbar()
    {
        if(is_null($this->navbar)) {
            $this->navbar = MenuItem::with(['subMenus' => function($query){
                return $query->orderBy('order', 'asc');
            }])->orderBy('order', 'asc')->parents()->active(app()->getLocale())->get();
        }

        view()->composer('site.layouts.partials._navbar', function($view){
            $view->with([
                'navbar' => $this->navbar
            ]);
        });
    }

    protected function setCurrentNav($url = null)
    {
        if(is_null($url)) $url = url()->current();

        config()->set('site.current_nav', $url);
    }

    protected function getBanner()
    {
        $this->banner = Slide::with('image')->active(app()->getLocale())->get();
        view()->share('banner', $this->banner);
    }

}