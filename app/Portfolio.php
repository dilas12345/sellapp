<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Portfolio extends Model
{
    public function portfolio_card_details()
    {
        return $this->hasMany(PortfolioDetail::class, '', 'portfolio_id');
    }
}
