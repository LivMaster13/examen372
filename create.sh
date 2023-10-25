#! /bin/bash

rm -rf webapp

mkdir webapp

cd webapp

mkdir css
mkdir js
mkdir docs

mkdir img

cd docs

mkdir text
mkdir python

cd ..

for file in index.html style.css app.js main.py
do
    touch ./"${file}"
done

curl -o meme.jpg "https://pm1.aminoapps.com/7021/417429318f6b29b6bc737fb95ba1ddafc9ba2decr1-720-642v2_hq.jpg"

read -p "Introduce la cantidad de archivos a crear:" numfiles
for x in $( seq 1 $numfiles )
do
    echo "Archivo ${x}" > "file${x}.txt"
done

mv style.css css/

mv *.txt docs/text/

mv main.py docs/python

mv app.js js/

mv meme.jpg img/

echo -e '<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cheems I love you 💖🐶</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="./css/style.css">
    
</head>
<body>
    <main id="content">
        <img id="cheems-img" src="https://img.asmedia.epimg.net/resizer/zCBy1qXw2E26HUAAQTBOYB0eSko=/736x414/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/KKF52TVGVNCKJFW6RGQRBR6OBE.png" alt="Perrito Cheems">
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/tsparticles-confetti@2.12.0/tsparticles.confetti.bundle.min.js"></script>
    <script src="./js/app.js"></script>
</body>
</html>' > index.html

echo -e 'body {
    font-family: 'Roboto', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #333;
}

#cheems-img {
    cursor: pointer;
}

h1 {
    font-size: 4rem; /* Tamaño de fuente de 4rem */
    color: #fff; /* Texto blanco */
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Sombra de texto */
}' > css/style.css

echo -e '// Add envent click to image
const content = document.getElementById("content");
const cheemsImg = document.getElementById("cheems-img");
const h1 = document.createElement("h1");
h1.textContent = "¡Felicidades Cheems 😭!";

cheemsImg.addEventListener("click", function() {
    cheemsImg.style.display = "none"; // Hide image
    content.appendChild(h1); // Add h1 element
    explode();
    
});

// Function to make explode confetti
function explode() {
    const duration = 15 * 1000,
    animationEnd = Date.now() + duration,
    defaults = { startVelocity: 30, spread: 360, ticks: 60, zIndex: 0 };

    function randomInRange(min, max) {
    return Math.random() * (max - min) + min;
    }

    const interval = setInterval(function() {
    const timeLeft = animationEnd - Date.now();

    if (timeLeft <= 0) {
        return clearInterval(interval);
    }

    const particleCount = 50 * (timeLeft / duration);

    // since particles fall down, start a bit higher than random
    confetti(
        Object.assign({}, defaults, {
        particleCount,
        origin: { x: randomInRange(0.1, 0.3), y: Math.random() - 0.2 },
        })
    );
    confetti(
        Object.assign({}, defaults, {
        particleCount,
        origin: { x: randomInRange(0.7, 0.9), y: Math.random() - 0.2 },
        })
    );
    }, 250);
}' > js/app.js

start index.html