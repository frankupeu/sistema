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
        Schema::create('notificaciones', function (Blueprint $table) {
            $table->id('id_notificacion');
            $table->foreignId('id_persona')->constrained('personas', 'id_persona')->onUpdate('cascade')->onDelete('cascade');
            $table->enum('tipo_notificacion', ['tardanza', 'ausencia', 'recordatorio']);
            $table->text('mensaje');
            $table->dateTime('fecha_notificacion');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('notificaciones');
    }
};
