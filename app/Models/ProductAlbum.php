<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Blackburn\Traits\ImageUploadTrait;

class ProductAlbum extends BaseModel
{
    use ImageUploadTrait;

    protected $table = 'product_albums';

    protected $guarded = ['id'];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function imageFullLink($absolute = true) {
        return route('images.show_image', $this->image_filename, $absolute);
    }

    public function thumbFullLink() {
        return route('images.show_thumb', $this->thumb_filename);
    }

}
