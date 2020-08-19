//This screen is displayed when we press the edit product item.
//This screen is also used for adding new products to the shop page.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode  =  FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(id: null, title: '', description: '', price: 0.0, imageUrl: '');
var _isInit = true;
var _initValues = {
  'title':'',
  'description':'',
  'price':'',
  'imageUrl':'',
};
@override
  void didChangeDependencies() {
    
    if(_isInit){
final productId = ModalRoute.of(context).settings.arguments as String;
if(productId != null){
  _editedProduct = Provider.of<Products>(context,listen: false).findById(productId);
_initValues = {
      'title':_editedProduct.title,
      'description':_editedProduct.description,
      'price':_editedProduct.price.toString(),
      // 'imageUrl':_editedProduct.imageUrl,
      'imageUrl':'',
    };
    _imageUrlController.text = _editedProduct.imageUrl;
}

    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }
  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    super.dispose();
  }
  void _updateImageUrl(){
    if(!_imageUrlFocusNode.hasFocus){
      if (
      (!_imageUrlController.text.startsWith('http')&&
      !_imageUrlController.text.startsWith('https'))||
      (!_imageUrlController.text.endsWith('.png')&&
      !_imageUrlController.text.endsWith('.jpg')&&
      !_imageUrlController.text.endsWith('jpeg'))){
        return;
      }
      
    setState(() {
      
    });}
  }
  void _saveForm(){
    final isValid = _form.currentState.validate();
    if (!isValid){

      return;
    }
    _form.currentState.save();
    // print(_editedProduct.title);
    //  print(_editedProduct.id);
    //   print(_editedProduct.price);
    //    print(_editedProduct.imageUrl);
    //     print(_editedProduct.description);
    if(_editedProduct.id != null){
      Provider.of<Products>(context,listen: false).updateProduct(_editedProduct.id,_editedProduct);
    }else{
    Provider.of<Products>(context,listen: false).addProduct(_editedProduct);
    }
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Products'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.save),
        onPressed: _saveForm,
        ),
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
                  child: ListView(
            children:<Widget>[
              TextFormField(
                initialValue: _initValues['title'],
                onSaved: (value){
                  _editedProduct = Product(id: _editedProduct.id, 
                  isFavourite: _editedProduct.isFavourite,
                  title: value,
                   description: _editedProduct.description,
                    price: _editedProduct.price,
                     imageUrl: _editedProduct.imageUrl,
                     
                  );
                },
                decoration: InputDecoration(
                  labelText: 'Title'
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value){
                  if(value.isEmpty){
                    return 'Please provide a Title';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                onSaved: (value){
                  _editedProduct = Product(id: _editedProduct.id, 
                  isFavourite: _editedProduct.isFavourite,
                  title: _editedProduct.title,
                   description: _editedProduct.description,
                    price: double.parse(value),
                     imageUrl: _editedProduct.imageUrl
                  );
                },
                 validator: (value){
                  if(value.isEmpty){
                    return 'Please provide a valid input';
                  }
                  if (double.parse(value) == null){
                    return 'Please provide a valid price';
                  }
                  if(double.parse(value) <=0){
                    return 'You Entered an invalid price';
                  } 

                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
              ),
              TextFormField(
                initialValue: _initValues['description'],
                onSaved: (value){
                  _editedProduct = Product(id: _editedProduct.id, 
                  isFavourite: _editedProduct.isFavourite, 
                  title: _editedProduct.title,
                   description: value,
                    price: _editedProduct.price,
                     imageUrl: _editedProduct.imageUrl
                  );
                },
                validator: (value){
                  if (value.isEmpty){
                    return 'You cant leave this empty';
                  }
                  if(value.length < 10){
                    return 'Enter atleast 10 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                focusNode: _descriptionFocusNode,
                
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:<Widget>[
                  Container(
                    
                    height:100,
                    width: 100,
                    margin: EdgeInsets.only(top:8,right:10),
                    decoration: BoxDecoration(
                      border:Border.all(width:1),
                      color: Colors.grey[200],
                      
                    ),
                    child: Container(
                      child: _imageUrlController.text.isEmpty? Text('Enter a URL',): Image.network(_imageUrlController.text,fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                                    child: TextFormField(
                                      
                                      onSaved: (value){
                  _editedProduct = Product(id: _editedProduct.id, 
                  isFavourite: _editedProduct.isFavourite,
                  title: _editedProduct.title,
                   description: _editedProduct.description,
                    price: _editedProduct.price,
                     imageUrl: value
                  );
                  
                },
                validator: (value){
                  if (value.isEmpty){
                    return 'Please Enter an Image URL';
                  }
                   if(!value.startsWith('http')&& !value.startsWith('https')){
                     return 'Invalid Image';
                   }
                   if (value.endsWith('.jpg')&& value.endsWith('.png')&& value.endsWith('.jpeg')
                   ){
                     return 'Invalid Image Format';
                   }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Image URL',
                ),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.next,
               controller: _imageUrlController,
               focusNode: _imageUrlFocusNode,
               onFieldSubmitted: (_){
                 _saveForm();
               },
              ),
                  ),
                ]
              )
            ]
          ),
        ),
      )

      
    );
  }
}