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
        Schema::create('horarios_excepcionales', function (Blueprint $table) {
            $table->id('id_horario_excepcional');
            $table->foreignId('id_persona')->constrained('personas', 'id_persona')->onUpdate('cascade')->onDelete('cascade');
            $table->date('fecha_excepcion');
            $table->time('hora_inicio');
            $table->time('hora_fin');
            $table->text('descripcion')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('horarios_excepcionales');
    }
};
