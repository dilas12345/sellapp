<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('gobiz_transaction_id')->uniqid();
            $table->string('transaction_date');
            $table->string('transaction_id')->nullable();
            $table->string('user_id');
            $table->string('plan_id');
            $table->longText('description')->nullable();
            $table->string('payment_gateway_name')->nullable();
            $table->string('transaction_currency')->nullable();
            $table->string('transaction_amount')->nullable();
            $table->string('invoice_number')->nullable();
            $table->string('invoice_prefix')->nullable();
            $table->longText('invoice_details')->nullable();
            $table->string('payment_status')->nullable();
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
        Schema::dropIfExists('transactions');
    }
}
