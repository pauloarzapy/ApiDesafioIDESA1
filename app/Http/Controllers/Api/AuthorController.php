<?php
declare(strict_types=1);
namespace App\Http\Controllers\Api;

use App\Models\Author;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class AuthorController extends Controller
{
    /**
     * Lista todos los autores
    */
    public function index(): JsonResponse
    {
        $authores = Author::all();

        return response()->json([
            "status" => true,
            "message" => "Listado de Autores",
            "data" => $authores
        ], 200);      
    }

    /**
     * Lista los datos de un autor especifico
    */
    public function show(int $id): JsonResponse
    {
        $author = Author::find($id);

        if (is_null($author)){
            return response()->json([
                "status" => true,
                "message" => "Datos del Autor",
                "data" => "No hay datos para el id especificado"
            ], 404); 
        }
        
        return response()->json([
            "status" => true,
            "message" => "Datos del Autor",
            "data" => $author
        ], 200);    
    }

    /**
     * Crea un nuevo Autor.
    */
    public function create(Request $request): JsonResponse
    {        
        $messages_validacion = [
            "name.required" => "El nombre es obligatorio!",         
            "birthdate.required" => "La fecha de nacimiento es obligatoria!",
            "nationality.required" => "La nacionalidad es obligatoria!"
        ];

        try
        {       
            $validator = Validator::make($request->all(), [
                "name" => "required",               
                "birthdate" => "required",
                "nationality" => "required"
            ], $messages_validacion);

            if ($validator->fails()) {           
                    return response()->json([
                    "status" => false,
                    "message" => "Errores de validacion para los datos del autor a crear.",
                    "data" => $validator->errors()->all()
                    ], 422);
                }
        } catch(Exception $exception) {
            return response()->json([
                "status" => false,
                "message" => "Exception durante la validacion de los datos del autor a crear.",
                "data" => $exception->getMessage()
                ], 422);
        }

        try
        {
            $author = Author::create([
                "name" => $request->name,
                "birthdate" => Carbon::createFromFormat("d/m/Y", str_replace("-", "/", $request->birthdate))->format("Y-m-d"),
                "nationality" => $request->nationality
            ]);

            return response()->json([
                "status" => true,
                "message" => "Datos especificados correctos.",
                "data" => "Autor guardado exitosamente"
            ], 200);

        } catch(Exception $exception) {
            
            return response()->json([
                "status" => false,
                "message" => "Exception al intentar crear un autor.",
                "data" => $exception->getMessage()
                ], 422);
        }
    }
    
    /**
     * Actualiza los datos de un autor especifico.
    */
    public function update(Request $request, int $id): JsonResponse
    {
        $author = Author::find($id);

        if (is_null($author)){
            return response()->json([
                "status" => true,
                "message" => "Datos no encontrados",
                "data" => "No hay datos para el id especificado"
            ], 404); 
        }

        try
        { 
            $author->name = $request->name;
            $author->birthdate = Carbon::createFromFormat("d/m/Y", str_replace("-", "/", $request->birthdate))->format("Y-m-d");
            $author->nationality = $request->nationality;
            $author->update();

            return response()->json([
                "status" => true,
                "message" => "Datos modificados del Autor",
                "data" => $author
            ], 200); 

        } catch(Exception $exception) {            
            return response()->json([
                "status" => false,
                "message" => "Exception al intentar actualizar el autor.",
                "data" => $exception->getMessage()
                ], 422);
        }   
    }

    /**
     * Elimina un autor de la base de datos
    */
    public function destroy(int $id): JsonResponse
    {
        $author = Author::find($id);

        if (is_null($author)) { 

            return response()->json([
                "status" => false,
                "message" => "Autor no borrado.",
                "data" => "No existe el autor especificado."
            ], 404); 
        } 

        try {
            $author->delete();

            return response()->json([
                "status" => true,
                "message" => "Autor eliminado correctamente",
                "data" => $author
            ], 200);

        } catch(Exception $exception) {
            return response()->json([
                "status" => false,
                "message" => "Exception al intentar eliminar un autor.",
                "data" => $exception->getMessage()
                ], 422);
        }        
    }
}
