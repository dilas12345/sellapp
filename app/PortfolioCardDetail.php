<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PortfolioDetail extends Model
{
    public function business_cards()
    {
        return $this->belongsTo(Portfolio::class, '', 'portfolio_id');
    }
}
