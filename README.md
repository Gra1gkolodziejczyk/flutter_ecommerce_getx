# e_commerce_front_getx

# Doc install (Linux)

## 1- installer flutter 

aller sur : 
```
https://docs.flutter.dev/get-started/install/linux
```
installer via snapd: 
```
sudo snap install flutter --classic
```

ou 

installer via ce lien
```
https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.12-stable.tar.xz
```

dé-zipé le fichier dans un dossier development et le mettre dans le path
```
export PATH="$PATH:`pwd`/flutter/bin"
```
test :
```
flutter doctor
```

## 2 - installer Android studio 

lien du telechargement
```
https://developer.android.com/studio
```
suivre les instructions du logiciel 
accepté les conditions général d'utilisations etc... 

Dans device manager de Android studio télécharger un émulateur (de préférence de grande taille pour notre application)


accepté les licences d'android avec cette commande :
```
flutter doctor --android-licenses
```


## 3 - run l'application 

Une fois l'installation d'android studio terminé,
mettez en marche l'émulateur 
ouvrer le terminal de android studio ou un terminal classic 
et faite la commande : 

pour installer les dépendances :
```
flutter pub get 
```
pour run le projet :
```
flutter run
```
ou runner le projet en mode debug cliquer sur le bouton vert dans la barre d'outils en haut 

Profiter de notre magnifique e-commerce ;))

+ à mettre ça dans un fichier .env

```
URL_API="http://161.97.90.183:8000"
STRIPE_API_KEY='pk_test_51Ml9mZBikVn85IoUlXLM3RX77AtBDcCdsQXNoA9sKVKOkjabUudluKUwHDYt601c9lXKgSTr27wGZvS8uM1HJuQj00o5U2qyq7'
```


