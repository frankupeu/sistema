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
        Schema::create('integraciones', function (Blueprint $table) {
            $table->id('id_integracion');
            $table->string('sistema_externo', 100);
            $table->date('fecha_vinculacion');
            $table->string('tipo_integracion', 100);
            $table->text('detalles')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('integraciones');
    }
};
