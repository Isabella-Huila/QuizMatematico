#!/bin/bash

echo "Bienvenido/a al Quiz Matemático :)"

echo "Estas son las reglas de juego:

1. Tienes 3 intentos para responder cada pregunta.

2. Si fallas 3 veces, se te mostrará la respuesta correcta.

3. Puedes elegir entre suma, resta, multiplicación y división.

Eso es todo, Felices juegos del Hambre y que la suerte esté siempre de tu lado."

while true; do
  echo "Selecciona una operación:"
  echo "1) Suma"
  echo "2) Resta"
  echo "3) Multiplicación"
  echo "4) División"
  echo "5) Salir"
  read -p "Opción: " opcion

  case $opcion in
    1)
      a=$((RANDOM % 100 + 1))
      b=$((RANDOM % 100 + 1))
      resultado=$((a + b))
      pregunta="¿Cuánto es $a + $b?"
      ;;

    2)
      a=$((RANDOM % 100 + 1))
      b=$((RANDOM % 100 + 1))
      if [ $a -lt $b ]; then
        temp=$a
        a=$b
        b=$temp
      fi
      resultado=$((a - b))
      pregunta="¿Cuánto es $a - $b?"
      ;;

    3)
      a=$((RANDOM % 100 + 1))
      b=$((RANDOM % 10 + 1))
      resultado=$((a * b))
      pregunta="¿Cuánto es $a × $b?"
      ;;

    4)
      b=$((RANDOM % 10 + 1))
      resultado=$((RANDOM % 100 + 1))
      a=$((resultado * b))
      pregunta="¿Cuánto es $a ÷ $b?"
      ;;

    5)
      echo "¡Gracias por jugar!"
      exit 0
      ;;

    *)
      echo "Opción no válida. Intenta de nuevo."
      continue
      ;;
  esac

  intentos=0
  acertado=false

  while [ $intentos -lt 3 ]; do
    read -p "$pregunta " respuesta
    if [ "$respuesta" -eq "$resultado" ] 2>/dev/null; then
      echo "¡Correcto!"
      acertado=true
      break
    else
      echo "❌ Incorrecto."
      intentos=$((intentos + 1))
      if [ $intentos -lt 3 ]; then
        echo "Te quedan $((3 - intentos)) intento(s)."
      fi
    fi
  done

  if [ "$acertado" = false ]; then
    echo "!!!Has fallado 3 veces. La respuesta correcta era: $resultado"
  fi

done
