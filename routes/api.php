<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\AuthorController;
use App\Http\Controllers\Api\BookController;

Route::post("/auth/register", [AuthController::class, "register"]);
Route::post("/auth/login", [AuthController::class, "login"]);

Route::get("/authors", [AuthorController::class, "index"]
)->middleware("auth:sanctum");

Route::get("/authors/{id}",  [AuthorController::class, "show"]
)->middleware("auth:sanctum");

Route::post("/authors", [AuthorController::class, "create"]
)->middleware("auth:sanctum");

Route::put("/authors/{id}",  [AuthorController::class, "update"]
)->middleware("auth:sanctum");

Route::delete("/authors/{id}",  [AuthorController::class, "destroy"]
)->middleware("auth:sanctum");


Route::get("/books", [BookController::class, "index"]
)->middleware("auth:sanctum");

Route::get("/books/{id}",  [BookController::class, "show"]
)->middleware("auth:sanctum");

Route::post("/books", [BookController::class, "create"]
)->middleware("auth:sanctum");

Route::put("/books/{id}",  [BookController::class, "update"]
)->middleware("auth:sanctum");

Route::delete("/books/{id}",  [BookController::class, "destroy"]
)->middleware("auth:sanctum");