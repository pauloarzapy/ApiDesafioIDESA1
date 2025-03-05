<?php
declare(strict_types=1);
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Book;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class BookController extends Controller
{
    /**
     * Lista todos los libros
    */
    public function index(): JsonResponse
    {
        $books = Book::all();

        return response()->json([
            "status" => true,
            "message" => "Listado de Libros",
            "data" => $books
        ], 200);      
    }

    /**
     * Lista los datos de un libro especifico
    */
    public function show(int $id): JsonResponse
    {
        $book = Book::find($id);

        if (is_null($book)){
            return response()->json([
                "status" => true,
                "message" => "Datos del Libro",
                "data" => "No hay datos para el id especificado"
            ], 404); 
        }
        
        return response()->json([
            "status" => true,
            "message" => "Datos del Libro",
            "data" => $book
        ], 200);    
    }

    /**
     * Crea un nuevo libro.
    */
    public function create(Request $request): JsonResponse
    { 
        $messages_validacion = [
            "title.required" => "El titulo es obligatorio!",            
            "isbn.required" => "El isbn es obligatoria!",
            "published_date.required" => "La fecha de publicacion es obligatoria!",
            "author_id.required" => "El author_id es obligatorio!", 
        ];

        try
        {       
            $validator = Validator::make($request->all(), [
                "title" => "required",               
                "isbn" => "required",
                "published_date" => "required",
                "author_id" => "required"
            ], $messages_validacion);

            if ($validator->fails()) {           
                    return response()->json([
                    "status" => false,
                    "message" => "Errores de validacion para los datos del libro a crear.",
                    "data" => $validator->errors()->all()
                    ], 422);
                }
        } catch(Exception $exception) {
            return response()->json([
                "status" => false,
                "message" => "Exception durante la validacion de los datos del libro a crear.",
                "data" => $exception->getMessage()
                ], 422);
        }

        try
        {
            $book = Book::create([
                "title" => $request->title,
                "isbn" => $request->isbn,
                "published_date" => Carbon::createFromFormat("d/m/Y", str_replace("-", "/", $request->published_date))->format("Y-m-d"),
                "author_id" => $request->author_id
            ]);

            return response()->json([
                "status" => true,
                "message" => "Datos especificados correctos.",
                "data" => "Libro guardado exitosamente"
            ], 200);

        } catch(Exception $exception) {
            
            return response()->json([
                "status" => false,
                "message" => "Exception al intentar crear un libro.",
                "data" => $exception->getMessage()
                ], 422);
        }
    }
    
    /**
     * Actualiza los datos de un libro especifico.
    */
    public function update(Request $request, int $id): JsonResponse
    {
        $book = Book::find($id);

        if (is_null($book)){
            return response()->json([
                "status" => true,
                "message" => "Datos no encontrados",
                "data" => "No hay datos para el id especificado"
            ], 404); 
        }

        try
        { 
            $book->title = $request->title;
            $book->isbn = $request->isbn;
            $book->published_date = Carbon::createFromFormat("d/m/Y", str_replace("-", "/", $request->published_date))->format("Y-m-d");
            $book->author_id = $request->author_id;
            $book->update();

            return response()->json([
                "status" => true,
                "message" => "Datos modificados del libro",
                "data" => $book
            ], 200); 

        } catch(Exception $exception) {            
            return response()->json([
                "status" => false,
                "message" => "Exception al intentar actualizar el libro.",
                "data" => $exception->getMessage()
                ], 422);
        }   
    }

    /**
     * Elimina un libro de la base de datos
    */
    public function destroy(int $id): JsonResponse
    {
        $book = Book::find($id);

        if (is_null($book)) { 

            return response()->json([
                "status" => false,
                "message" => "Libro no borrado.",
                "data" => "No existe el libro especificado."
            ], 404); 
        } 

        try {
            $book->delete();

            return response()->json([
                "status" => true,
                "message" => "Libro eliminado correctamente",
                "data" => $book
            ], 200);

        } catch(Exception $exception) {
            return response()->json([
                "status" => false,
                "message" => "Exception al intentar eliminar un libro.",
                "data" => $exception->getMessage()
                ], 422);
        }        
    }
}
