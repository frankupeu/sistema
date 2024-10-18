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
        Schema::create('permisos', function (Blueprint $table) {
            $table->id('id_permiso');
            $table->foreignId('id_persona')->constrained('personas', 'id_persona')->onUpdate('cascade')->onDelete('cascade');
            $table->date('fecha_solicitud');
            $table->date('fecha_inicio');
            $table->date('fecha_fin');
            $table->enum('estado_permiso', ['pendiente', 'aprobado', 'rechazado']);
            $table->enum('tipo_permiso', ['vacaciones', 'enfermedad', 'otro']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('permisos');
    }
};
