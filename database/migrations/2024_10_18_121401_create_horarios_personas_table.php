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
        Schema::create('horarios_personas', function (Blueprint $table) {
            $table->id('id_horario_persona');
            $table->foreignId('id_persona')->constrained('personas', 'id_persona')->onUpdate('cascade')->onDelete('cascade');
            $table->foreignId('id_turno')->constrained('turnos', 'id_turno')->onUpdate('cascade')->onDelete('cascade');
            $table->date('fecha_asignacion');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('horarios_personas');
    }
};
