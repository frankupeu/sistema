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
        Schema::create('auditorias', function (Blueprint $table) {
            $table->id('id_auditoria');
            $table->foreignId('id_persona')->constrained('personas', 'id_persona')->onUpdate('cascade')->onDelete('cascade');
            $table->string('accion_realizada', 100);
            $table->dateTime('fecha_accion');
            $table->text('detalles')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('auditorias');
    }
};
