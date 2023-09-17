<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePortfoliosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('portfolios', function (Blueprint $table) {
            $table->increments('id');
            $table->string('portfolio_id');
            $table->string('user_id');
            $table->string('theme_id')->nullable();
            $table->string('theme_color')->nullable();
            $table->string('portfolio_lang')->default('EN');
            $table->string('cover');
            $table->string('profile');
            $table->string('porfolio_url')->unique();
            $table->string('portfolio_type');
            $table->string('title');
            $table->longText('sub_title');
            $table->longText('description')->nullable();
            $table->string('portfolio_status')->default('activated');
            $table->string('status')->default(1);
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('portfolios');
    }
}
