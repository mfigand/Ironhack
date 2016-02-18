function caesarCipher (message, shift) { 
   var mSplit = message.split("")
   var cipherArray = []
   for (i = 0; i < mSplit.length; i++){
      var ascii = mSplit[i].charCodeAt(0);
        if (ascii >= 97 && ascii <= 122 && ascii != 32){
          cipherArray.push(String.fromCharCode(ascii+shift));
         }
        else if (ascii >= 65 && ascii <= 90 && ascii != 32){
          cipherArray.push(String.fromCharCode(ascii+shift));         
        }
        else {
          cipherArray.push(mSplit[i]);
        }
    }
   return cipherArray.join("");
}
var encrypted = caesarCipher("Et tu, brute?",-3);

console.log(encrypted);
//=> "_orqrp"
//=> "Bq qr, _orqb?"





















