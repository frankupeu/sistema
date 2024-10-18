<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tardanzas', function (Blueprint $table) {
            $table->id('id_tardanza');
            $table->foreignId('id_persona')->constrained('personas')->onUpdate('cascade')->onDelete('cascade');
            $table->date('fecha_tardanza');
            $table->time('hora_llegada');
            $table->text('justificacion')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tardanzas');
    }
};
