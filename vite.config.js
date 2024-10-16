import { defineConfig } from 'vite';

/*Librerias de vuejs*/
import vue from '@vitejs/plugin-vue';
import laravel from 'laravel-vite-plugin';

/*Librerias de desarrollo*/
import cleanPlugin from 'vite-plugin-clean';
import { visualizer } from 'rollup-plugin-visualizer';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/app.css',
                'resources/js/app.js'
            ],
            refresh: true,
        }),
        vue(),
        cleanPlugin({
            // Opciones: puedes especificar qué carpetas limpiar
            targets: ['dist/*', 'public/build/*'],
        }),
        visualizer({
            filename: './public/stats.html', // Archivo HTML que generará el reporte
            open: true, // Abre el reporte automáticamente después del build
        }),
    ],
    server: {
        host: '127.0.0.1',
        port: 3000,
        strictPort: true,
        open: true,
    },
    build: {
        outDir: 'public/build',
        emptyOutDir: true,
    },
});
