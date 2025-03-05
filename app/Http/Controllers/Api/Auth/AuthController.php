<?php
namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{    
    public function register(Request $request): JsonResponse
    {    
        $messages_validacion = [
            "name.required" => "El nombre es obligatorio!",
            "email.required" => "El email es obligatorio!",
            "password.required" => "El password es obligatorio!",
            "passwordConfirm.required" => "La confirmacion del password es obligatoria!"                 
        ];
       
        $validator = Validator::make($request->all(), [
             "name" => "required",
             "email" => "required|email",
             "password" => "required",
             "passwordConfirm" =>  "required|same:password"
         ], $messages_validacion);

       if ($validator->fails()) {           
            return response()->json([
             "status" => false,
             "message" => "Errores de validacion.",
             "data" => $validator->errors()->all()
            ], 422);
        }

        $user = User::create([
            "name" => $request->name,
            "email" => $request->email,
            "password" => bcrypt($request->password)
        ]);

        return response()->json([
            "status" => true,
            "message" => "Validaciones correctas.",
            "data" => "Registro exitoso"
        ], 200);
    }

    public function login(Request $request): JsonResponse
    {
        $datos = [];
        
        $validator = Validator::make($request->all(), [
             "email" => "required|email",
             "password" => "required"
            ]    
        );              

        $user = User::where("email", request()->email)->first();
        
        if ($validator->fails() || !$user || !Hash::check(request()->password, $user->password)) {
           
            return response()->json([
                "status" => false,
                "message" => "Credenciales no validas.",
                "data" => null
            ], 401);
        }

        $datos["name"] = $user->name;
        $datos["token"] = $user->createToken("NuevoToken")->plainTextToken;

        return response()->json([
            "status" => true,
            "message" => "Credenciales validas.",
            "data" => $datos
        ], 200);        
    }
}
