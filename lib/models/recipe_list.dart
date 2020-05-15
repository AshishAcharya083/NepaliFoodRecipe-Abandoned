import 'recipe_structure.dart';

final List<RecipeStructure> recipeList = [
  RecipeStructure(
      ename: 'Veg Sandwich',
      name: 'भेज स्यान्डविच',
      image: 'https://images.unsplash.com/photo-1539252554453-80ab65ce3586?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      
      description: 'descritption here',
      ingredients: {
        'Bread': 'ब्रेड - 2',
        'lettuce': 'सलाद - २ देखि ३ पातहरू',
        'cheese': 'चीज - १ टुक्रा',
        'tomato': 'टमाटर - १ गोल ​​गोल घेरामा काटियो',
        'green chilli ': 'हरियो घाउ मिर्च - केही राम्रो गोल घेरामा काटिएको ',
        'onion': 'प्याज- केही गोल गोल सर्कलमा काटिएको ',
        'Mayonnaise': 'मेयोनेज- (वैकल्पिक)',
      },
      stepsForCooking: [
        'ब्रेडको  खैरो पक्ष काट्नुहोस्',
        'ब्रेड एक मिनेट को लागी टोस्ट गर्नुहोस',
        'ब्रेड को एक तिर मेयोनेस फैलाउनुहोस',
        'ब्रेड्मा पनीर, सलाद, प्याज, टमाटर र हरियो घण्टी मिर्च राख्नुहोस्',
        'पहिलो ब्रेड्को  माथिको अर्को ब्रेड राख्नुहोस्',
        'स्यान्डविच विकर्ण गर्नको लागि दुई टुक्रा मा काट्नुहोस्',
        'Veggie sandwich is ready to serve!',
        'चिकन स्यान्डविच बनाउनका लागि तपाईले कुखुरा प्याटीहरू थप गर्नु पर्छ (चिकन किमा बर्गर)',
      ]),
  RecipeStructure(name: 'खुर्सानी तिल को अचार ',
  image: 'https://www.indianfoodrecipesonline.com/wp-content/uploads/2017/12/Til-Chutney-Recipe-in-Hindi.jpg',
   stepsForCooking: [
    'हरियो खोर्सोलाई आधा भागमा काट्नुहोस् (सिधा होइन)',
    'स्टोभ खोल्नुहोस् र प्यान तताउनुहोस्',
    'यसमा तेल थप्नुहोस्, जब तेल तातो छ भने मेथीको दाना थप्नुहोस्',
    'जब यो सुनहरी खैरोमा परिवर्तन हुन्छ हरियो मिर्च जोड्नुहोस्',
    'जब ती गोल्डन खैरो बन्छन् भने तिलको पाउडर र नुन थप्नुहोस्',
    'पानी थप्नुहोस्, र सबै पानी सुक्खा सम्म पकाउनुहोस्',
    'ग्यास बन्द गर्नुहोस् र कागती जुस जोड्नुहोस् र राम्रोसँग मिक्स गर्नुहोस्',
    'तपाईंको तिल र खोर्सानीको चटनी सेवा गर्नको लागि तयार छ',
    'यो चटनी चामल, रोटी, वा च्युराको साथ उत्तम हो!',
  ]),
  RecipeStructure(
      name: 'भारतीय चिकन मद्रास करी',
      ename: 'Indian Chicken Madras Curry Recipe',
      type: 'nveg',
      image: 'https://lh3.googleusercontent.com/proxy/AyZtfCWLuDgC44j9msul3lxbHwp1TCEaZbJi6SjfuCI-aB-XEGsfBw3yBnB6yxq4xFt9w5X-x3aesdUUKlo-fsROm6v0YSrq2hGTbGQRsefdhgUGbTHuvDqeReHkoZf7jDAMsEqwXARB',
      ingredients: {
        'chicken':
            '४  छालाविहीन, हड्डी रहित कुखुराको स्तनहरू १ १/२ ईन्च अंशहरूमा काटिन्छ   र सुक्खा राखिन्छ',
        'onion': '१ प्याज',
        'Garlic': '८ लहसुन ',
        'Ginger': '१  अदुवा',
        'jalapeno': '१  jalapeno',
        'Vegetable oil': '१ चम्मच वनस्पति तेल',
        'Hot spice':
            '१ चम्मच गरम मसला वा १ चम्मच प्रत्येक, जीरा, धनिया र कद्दू पाई मसला',
        'chilli powder': '२ चम्मच खुर्सानी ',
        'Turmeric': '१/२ चम्मच हल्दी',
        'salt': '१ चम्मच नुन',
        'tomato': '२ कप पिसेको टमाटर ',
      })
];
