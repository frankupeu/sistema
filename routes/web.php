<?php

use Illuminate\Support\Facades\Route;

Route::get('{any}', function () {
    return view('app'); // Devuelve la vista principal de Vue.js
})->where('any', '.*'); // Captura todas las rutas
