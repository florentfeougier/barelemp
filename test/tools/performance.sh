declare -a urls=( "/" "login" "a-propos" "rgpd" "shop/produits/cactus-du-mali" "/ventes" "/shop" "ventes" "ventes/valence" )
# declare -a urls=(
"/" "login" "a-propos" "rgpd" "shop/produits/cactus-du-mali" "/ventes" "/shop" "ventes" "ventes/valence" "ventes/montelimar" "fiches-entretien" "fiches-entretien/aloevera" "fiches-entretien/monstera" "entretien" "blog" "blog/astuces" "box" "/blog/astuces/comment-creer-son-gel-aloevera" 


declare -a array=("/" "/login" "/a-propos" "/rgpd" "/shop/produits/cactus-du-mali" "/ventes" "/shop" "/ventes" "/ventes/valence" "/ventes/montelimar" "/fiches-entretien" "fiches-entretien/aloevera" "/fiches-entretien/monstera" "/entretien" "/blog" "/blog/astuces" "/box" "/blog/astuces/comment-creer-son-gel-aloevera") 

# get length of an array
arraylength=${#array[@]}*20

# use for loop to read all values and indexes
for (( i=1; i<${arraylength}*20; i++ ));
do
  echo "New request " $i " / " ${arraylength} " - URL:" ${array[$i-1]}
  curl https://www.plantesaddict.fr${array[$i-1]}
  echo ' '
done
