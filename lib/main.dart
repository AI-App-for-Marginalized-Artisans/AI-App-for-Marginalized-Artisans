import 'dart:typed_data';

import 'ai_service.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

enum AppLanguage { english, tamil, hindi }

class LanguageManager {
  static final ValueNotifier<AppLanguage> current = ValueNotifier(
    AppLanguage.english,
  );

  static void changeLanguage(AppLanguage language) {
    current.value = language;
  }
}

class AppText {
  static String get(String key) {
    switch (LanguageManager.current.value) {
      case AppLanguage.tamil:
        return tamil[key] ?? english[key] ?? key;
      case AppLanguage.hindi:
        return hindi[key] ?? english[key] ?? key;
      case AppLanguage.english:
        return english[key] ?? key;
    }
  }

  static const Map<String, String> english = {
    // General
    'choose_language': 'Choose your language',
    'select_language': 'Select a language to continue.',
    'english': 'English',
    'tamil': 'தமிழ்',
    'hindi': 'हिन्दी',
    'language': 'Language',
    'help': 'Help & Support',
    'home': 'Home',
    'products': 'Products',
    'profile': 'Profile',
    'search': 'Search',
    'saved': 'Saved',

    // Welcome
    'welcome_title': 'Where tradition\nmeets opportunity.',
    'welcome_subtitle': 'A simple digital space for artisans to showcase their craft and reach more people.',
    'get_started': 'Get Started',
    'learn_more': 'Learn more about Artisan',

    // Login
    'welcome_back': 'Welcome back',
    'create_your_account': 'Create your account',
    'join_community': 'Join the Artisan community.',
    'sign_in_marketplace': 'Sign in to continue to your marketplace.',
    'full_name': 'Full name',
    'enter_name': 'Enter your name',
    'email_address': 'Email address',
    'email_hint': 'you@example.com',
    'password': 'Password',
    'enter_password': 'Enter your password',
    'forgot_password': 'Forgot password?',
    'create_account': 'Create Account',
    'sign_in': 'Sign In',
    'already_account': 'Already have an account?',
    'dont_have_account': "Don't have an account?",
    'sign_up': 'Sign up',
    'sign_in_small': 'Sign in',

    // Choose user
    'how_use_artisan': 'How will you use\nArtisan?',
    'choose_experience': 'Choose the experience that fits you.',
    'i_am_artisan': 'I am an Artisan',
    'artisan_subtitle': 'Create listings and showcase my craft.',
    'i_am_buyer': 'I am a Buyer',
    'buyer_subtitle': 'Discover and shop authentic handmade products.',

    // Artisan dashboard
    'good_evening': 'Good evening, Artisan',
    'grow_craft': 'Grow your craft online.',
    'ready_add': 'Ready to add a new creation?',
    'ai_listing':
        'Let AI help turn your product photo into a polished listing.',
    'your_overview': 'Your overview',
    'recent_products': 'Recent products',
    'views': 'Views',

    // Artisan products
    'my_products': 'My Products',
    'manage_products': 'Manage everything you have published.',
    'add_product': 'Add New Product',

    // Artisan profile
    'my_profile': 'My Profile',
    'profile_subtitle': 'Tell buyers the story behind your craft.',
    'my_store': 'My Store',
    'edit_profile': 'Edit Profile',

    // Add product
    'add_product_title': 'Add Product',
    'create_listing': 'Create a listing',
    'listing_subtitle': 'Start with a few details about your creation.',
    'product_name': 'Product name',
    'product_name_hint': 'e.g. Handwoven Cotton Saree',
    'category': 'Category',
    'textiles': 'Textiles',
    'pottery': 'Pottery',
    'jewellery': 'Jewellery',
    'baskets': 'Baskets',
    'wooden_craft': 'Wooden Craft',
    'selling_price': 'Your selling price',
    'enter_price': 'Enter your price',
    'continue': 'Continue',

    // Upload
    'product_photo': 'Product Photo',
    'show_craft': 'Show us your craft',
    'upload_subtitle':
        'Upload a clear photo. AI will prepare it for your listing.',
    'add_product_photo': 'Add product photo',
    'photo_hint': 'JPG or PNG • clear and well lit',
    'gallery': 'Gallery',
    'camera': 'Camera',

    // Processing
    'preparing_listing': 'Preparing your listing',
    'understanding_craft':
        'Enhancing the image and understanding your craft...',
    'preparing_image': 'Preparing product image',
    'identifying_details': 'Identifying craft details',
    'creating_description': 'Creating your product description',

    // AI results
    'ai_results': 'AI Results',
    'found_details': 'We found the details',
    'review_ai': 'Review what AI detected before creating your listing.',
    'material': 'Material',
    'craft_type': 'Craft type',
    'colour': 'Colour',
    'pattern': 'Pattern',
    'traditional_pattern': 'Traditional geometric motif',
    'ai_confidence':
        'AI confidence: High\nYou can edit any detail before publishing.',
    'review_listing': 'Review Listing',

    // Review
    'review_listing_title': 'Review Listing',
    'listing_title': 'Listing title',
    'description': 'Description',
    'price': 'Price',
    'publish_product': 'Publish Product',

    // Success
    'product_live': 'Your product is live!',
    'product_live_subtitle':
        'Your creation is now ready to be discovered by buyers.',
    'back_dashboard': 'Back to Dashboard',

    // Buyer home
    'discover_meaningful': 'Discover something meaningful.',
    'authentic_products': 'Authentic products, crafted by real people.',
    'search_products': 'Search products or crafts',
    'explore_categories': 'Explore categories',
    'featured_crafts': 'Featured crafts',

    // Buyer search
    'find_products': 'Find products, materials and traditional crafts.',
    'search_handmade': 'Search handmade products...',

    // Buyer saved
    'saved_subtitle': 'Your favourite creations in one place.',

    // Buyer profile
    'buyer_profile_subtitle': 'Your Artisan marketplace account.',
    'personal_details': 'Personal details',
    'my_orders': 'My orders',
    'saved_addresses': 'Saved addresses',

    // Product details
    'about_craft': 'About this craft',
    'product_details': 'Product details',
    'buy_now': 'Buy Now',
    'by': 'by',
    'made_with_care': 'Made with care using',
    'traditional_technique': 'and the traditional',
    'technique': 'technique. Every piece carries the character of the artisan who created it.',

    // Product data
    'heritage_saree': 'Handwoven Heritage Saree',
    'terracotta_pot': 'Terracotta Leaf Pot',
    'palm_basket': 'Palm Leaf Basket',
    'brass_earrings': 'Brass Heritage Earrings',

    'meena_crafts': 'Meena Crafts',
    'kannan_pottery': 'Kannan Pottery',
    'lakshmi_weaves': 'Lakshmi Weaves',
    'ananya_studio': 'Ananya Studio',

    'cotton': 'Cotton',
    'clay': 'Clay',
    'palm_leaf': 'Palm Leaf',
    'brass': 'Brass',

    'handloom': 'Handloom',
    'terracotta': 'Terracotta',
    'handwoven': 'Handwoven',
    'handcrafted': 'Handcrafted',

    'indigo': 'Indigo',
    'earth_red': 'Earth Red',
    'natural': 'Natural',
    'gold': 'Gold',

    // Artisan profile
    'handloom_artisan_tamil_nadu': 'Handloom artisan • Tamil Nadu',
  };

  static const Map<String, String> tamil = {
    // General
    'choose_language': 'உங்கள் மொழியைத் தேர்ந்தெடுக்கவும்',
    'select_language': 'தொடர ஒரு மொழியைத் தேர்ந்தெடுக்கவும்.',
    'english': 'English',
    'tamil': 'தமிழ்',
    'hindi': 'हिन्दी',
    'language': 'மொழி',
    'help': 'உதவி மற்றும் ஆதரவு',
    'home': 'முகப்பு',
    'products': 'தயாரிப்புகள்',
    'profile': 'சுயவிவரம்',
    'search': 'தேடல்',
    'saved': 'சேமித்தவை',

    // Welcome
    'welcome_title': 'பாரம்பரியம்\nவாய்ப்பை சந்திக்கும் இடம்.',
    'welcome_subtitle': 'கைவினைஞர்கள் தங்கள் கைவினைப்பொருட்களை அறிமுகப்படுத்தி மேலும் பலரை சென்றடைய உதவும் எளிய டிஜிட்டல் தளம்.',
    'get_started': 'தொடங்குங்கள்',
    'learn_more': 'Artisan பற்றி மேலும் அறிக',

    // Login
    'welcome_back': 'மீண்டும் வரவேற்கிறோம்',
    'create_your_account': 'உங்கள் கணக்கை உருவாக்குங்கள்',
    'join_community': 'Artisan சமூகத்தில் இணையுங்கள்.',
    'sign_in_marketplace': 'சந்தையைத் தொடர உள்நுழையுங்கள்.',
    'full_name': 'முழு பெயர்',
    'enter_name': 'உங்கள் பெயரை உள்ளிடவும்',
    'email_address': 'மின்னஞ்சல் முகவரி',
    'email_hint': 'you@example.com',
    'password': 'கடவுச்சொல்',
    'enter_password': 'உங்கள் கடவுச்சொல்லை உள்ளிடவும்',
    'forgot_password': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா?',
    'create_account': 'கணக்கை உருவாக்கவும்',
    'sign_in': 'உள்நுழைக',
    'already_account': 'ஏற்கனவே கணக்கு உள்ளதா?',
    'dont_have_account': 'கணக்கு இல்லையா?',
    'sign_up': 'பதிவு செய்க',
    'sign_in_small': 'உள்நுழைக',

    // Choose user
    'how_use_artisan': 'Artisan-ஐ\nஎவ்வாறு பயன்படுத்துவீர்கள்?',
    'choose_experience': 'உங்களுக்கு பொருத்தமான அனுபவத்தைத் தேர்ந்தெடுக்கவும்.',
    'i_am_artisan': 'நான் ஒரு கைவினைஞர்',
    'artisan_subtitle':
        'தயாரிப்புகளை உருவாக்கி எனது கைவினையை அறிமுகப்படுத்துங்கள்.',
    'i_am_buyer': 'நான் ஒரு வாங்குபவர்',
    'buyer_subtitle': 'உண்மையான கைவினைப் பொருட்களை கண்டறிந்து வாங்குங்கள்.',

    // Artisan dashboard
    'good_evening': 'மாலை வணக்கம், கைவினைஞரே',
    'grow_craft': 'உங்கள் கைவினையை ஆன்லைனில் வளர்த்திடுங்கள்.',
    'ready_add': 'புதிய படைப்பைச் சேர்க்க தயாரா?',
    'ai_listing':
        'உங்கள் தயாரிப்பு புகைப்படத்தை சிறந்த பட்டியலாக மாற்ற AI உதவும்.',
    'your_overview': 'உங்கள் மேலோட்டம்',
    'recent_products': 'சமீபத்திய தயாரிப்புகள்',
    'views': 'பார்வைகள்',

    // Artisan products
    'my_products': 'எனது தயாரிப்புகள்',
    'manage_products':
        'நீங்கள் வெளியிட்ட அனைத்து தயாரிப்புகளையும் நிர்வகிக்கவும்.',
    'add_product': 'புதிய தயாரிப்பைச் சேர்க்கவும்',

    // Artisan profile
    'my_profile': 'எனது சுயவிவரம்',
    'profile_subtitle': 'உங்கள் கைவினையின் கதையை வாங்குபவர்களிடம் பகிருங்கள்.',
    'my_store': 'எனது கடை',
    'edit_profile': 'சுயவிவரத்தைத் திருத்தவும்',

    // Add product
    'add_product_title': 'தயாரிப்பைச் சேர்க்கவும்',
    'create_listing': 'பட்டியலை உருவாக்குங்கள்',
    'listing_subtitle':
        'உங்கள் படைப்பைப் பற்றிய சில விவரங்களுடன் தொடங்குங்கள்.',
    'product_name': 'தயாரிப்பு பெயர்',
    'product_name_hint': 'எ.கா. கைத்தறி பருத்தி சேலை',
    'category': 'வகை',
    'textiles': 'துணிகள்',
    'pottery': 'மண்பாண்டங்கள்',
    'jewellery': 'நகைகள்',
    'baskets': 'கூடைகள்',
    'wooden_craft': 'மர கைவினை',
    'selling_price': 'உங்கள் விற்பனை விலை',
    'enter_price': 'உங்கள் விலையை உள்ளிடவும்',
    'continue': 'தொடரவும்',

    // Upload
    'product_photo': 'தயாரிப்பு புகைப்படம்',
    'show_craft': 'உங்கள் கைவினையை எங்களுக்குக் காட்டுங்கள்',
    'upload_subtitle': 'தெளிவான புகைப்படத்தைப் பதிவேற்றுங்கள். AI உங்கள் பட்டியலைத் தயாரிக்கும்.',
    'add_product_photo': 'தயாரிப்பு புகைப்படத்தைச் சேர்க்கவும்',
    'photo_hint': 'JPG அல்லது PNG • தெளிவாகவும் நல்ல வெளிச்சத்துடனும்',
    'gallery': 'கேலரி',
    'camera': 'கேமரா',

    // Processing
    'preparing_listing': 'உங்கள் பட்டியல் தயாராகிறது',
    'understanding_craft':
        'படத்தை மேம்படுத்தி உங்கள் கைவினையைப் புரிந்துகொள்கிறது...',
    'preparing_image': 'தயாரிப்பு படத்தைத் தயாரிக்கிறது',
    'identifying_details': 'கைவினை விவரங்களை அடையாளம் காண்கிறது',
    'creating_description': 'தயாரிப்பு விளக்கத்தை உருவாக்குகிறது',

    // AI results
    'ai_results': 'AI முடிவுகள்',
    'found_details': 'விவரங்களைக் கண்டறிந்தோம்',
    'review_ai': 'உங்கள் பட்டியலை உருவாக்குவதற்கு முன் AI கண்டறிந்தவற்றைச் சரிபார்க்கவும்.',
    'material': 'பொருள்',
    'craft_type': 'கைவினை வகை',
    'colour': 'நிறம்',
    'pattern': 'வடிவம்',
    'traditional_pattern': 'பாரம்பரிய வடிவியல் வடிவம்',
    'ai_confidence': 'AI நம்பகத்தன்மை: அதிகம்\nவெளியிடுவதற்கு முன் எந்த விவரத்தையும் திருத்தலாம்.',
    'review_listing': 'பட்டியலைச் சரிபார்க்கவும்',

    // Review
    'review_listing_title': 'பட்டியலைச் சரிபார்க்கவும்',
    'listing_title': 'பட்டியல் தலைப்பு',
    'description': 'விளக்கம்',
    'price': 'விலை',
    'publish_product': 'தயாரிப்பை வெளியிடவும்',

    // Success
    'product_live': 'உங்கள் தயாரிப்பு நேரலையில் உள்ளது!',
    'product_live_subtitle':
        'உங்கள் படைப்பை இப்போது வாங்குபவர்கள் கண்டறியலாம்.',
    'back_dashboard': 'டாஷ்போர்டுக்குத் திரும்பவும்',

    // Buyer home
    'discover_meaningful': 'அர்த்தமுள்ள ஒன்றைக் கண்டறியுங்கள்.',
    'authentic_products':
        'உண்மையான மக்களால் உருவாக்கப்பட்ட உண்மையான தயாரிப்புகள்.',
    'search_products': 'தயாரிப்புகள் அல்லது கைவினைகளைத் தேடுங்கள்',
    'explore_categories': 'வகைகளை ஆராயுங்கள்',
    'featured_crafts': 'சிறப்பு கைவினைப்பொருட்கள்',

    // Buyer search
    'find_products':
        'தயாரிப்புகள், பொருட்கள் மற்றும் பாரம்பரிய கைவினைகளைத் தேடுங்கள்.',
    'search_handmade': 'கைவினைப் பொருட்களைத் தேடுங்கள்...',

    // Buyer saved
    'saved_subtitle': 'உங்களுக்குப் பிடித்த படைப்புகள் அனைத்தும் ஒரே இடத்தில்.',

    // Buyer profile
    'buyer_profile_subtitle': 'உங்கள் Artisan சந்தை கணக்கு.',
    'personal_details': 'தனிப்பட்ட விவரங்கள்',
    'my_orders': 'எனது ஆர்டர்கள்',
    'saved_addresses': 'சேமித்த முகவரிகள்',

    // Product details
    'about_craft': 'இந்த கைவினையைப் பற்றி',
    'product_details': 'தயாரிப்பு விவரங்கள்',
    'buy_now': 'இப்போது வாங்கவும்',
    'by': 'உருவாக்கியவர்',
    'made_with_care': 'கவனமாக',
    'traditional_technique': 'பாரம்பரிய',
    'technique': 'நுட்பத்தைப் பயன்படுத்தி உருவாக்கப்பட்டது. ஒவ்வொரு படைப்பிலும் அதை உருவாக்கிய கைவினைஞரின் தனித்தன்மை உள்ளது.',

    // Product data
    'heritage_saree': 'கைத்தறி பாரம்பரிய சேலை',
    'terracotta_pot': 'டெரகோட்டா இலை பானை',
    'palm_basket': 'பனை ஓலை கூடை',
    'brass_earrings': 'பித்தளை பாரம்பரிய காதணிகள்',

    'meena_crafts': 'மீனா கிராஃப்ட்ஸ்',
    'kannan_pottery': 'கண்ணன் மண்பாண்டங்கள்',
    'lakshmi_weaves': 'லட்சுமி வீவ்ஸ்',
    'ananya_studio': 'அனன்யா ஸ்டுடியோ',

    'cotton': 'பருத்தி',
    'clay': 'களிமண்',
    'palm_leaf': 'பனை ஓலை',
    'brass': 'பித்தளை',

    'handloom': 'கைத்தறி',
    'terracotta': 'டெரகோட்டா',
    'handwoven': 'கையால் நெய்யப்பட்டது',
    'handcrafted': 'கைவினையால் உருவாக்கப்பட்டது',

    'indigo': 'இண்டிகோ',
    'earth_red': 'மண் சிவப்பு',
    'natural': 'இயற்கை',
    'gold': 'தங்கம்',

    'handloom_artisan_tamil_nadu': 'கைத்தறி கைவினைஞர் • தமிழ்நாடு',
  };

  static const Map<String, String> hindi = {
    // General
    'choose_language': 'अपनी भाषा चुनें',
    'select_language': 'जारी रखने के लिए एक भाषा चुनें।',
    'english': 'English',
    'tamil': 'தமிழ்',
    'hindi': 'हिन्दी',
    'language': 'भाषा',
    'help': 'सहायता और समर्थन',
    'home': 'होम',
    'products': 'उत्पाद',
    'profile': 'प्रोफ़ाइल',
    'search': 'खोजें',
    'saved': 'सहेजे गए',

    // Welcome
    'welcome_title': 'जहाँ परंपरा\nअवसर से मिलती है।',
    'welcome_subtitle': 'कारीगरों के लिए अपने शिल्प को प्रदर्शित करने और अधिक लोगों तक पहुँचने का एक सरल डिजिटल स्थान।',
    'get_started': 'शुरू करें',
    'learn_more': 'Artisan के बारे में और जानें',

    // Login
    'welcome_back': 'वापसी पर स्वागत है',
    'create_your_account': 'अपना खाता बनाएँ',
    'join_community': 'Artisan समुदाय में शामिल हों।',
    'sign_in_marketplace':
        'अपने मार्केटप्लेस में जारी रखने के लिए साइन इन करें।',
    'full_name': 'पूरा नाम',
    'enter_name': 'अपना नाम दर्ज करें',
    'email_address': 'ईमेल पता',
    'email_hint': 'you@example.com',
    'password': 'पासवर्ड',
    'enter_password': 'अपना पासवर्ड दर्ज करें',
    'forgot_password': 'पासवर्ड भूल गए?',
    'create_account': 'खाता बनाएँ',
    'sign_in': 'साइन इन करें',
    'already_account': 'क्या आपके पास पहले से खाता है?',
    'dont_have_account': 'खाता नहीं है?',
    'sign_up': 'साइन अप करें',
    'sign_in_small': 'साइन इन करें',

    // Choose user
    'how_use_artisan': 'आप Artisan का\nकैसे उपयोग करेंगे?',
    'choose_experience': 'अपने लिए सही अनुभव चुनें।',
    'i_am_artisan': 'मैं एक कारीगर हूँ',
    'artisan_subtitle': 'लिस्टिंग बनाएँ और अपने शिल्प को प्रदर्शित करें।',
    'i_am_buyer': 'मैं एक खरीदार हूँ',
    'buyer_subtitle': 'प्रामाणिक हस्तनिर्मित उत्पाद खोजें और खरीदें।',

    // Artisan dashboard
    'good_evening': 'शुभ संध्या, कारीगर',
    'grow_craft': 'अपने शिल्प को ऑनलाइन बढ़ाएँ।',
    'ready_add': 'नई रचना जोड़ने के लिए तैयार हैं?',
    'ai_listing':
        'AI आपकी उत्पाद तस्वीर को एक बेहतर लिस्टिंग में बदलने में मदद करेगा।',
    'your_overview': 'आपका अवलोकन',
    'recent_products': 'हाल के उत्पाद',
    'views': 'दृश्य',

    // Artisan products
    'my_products': 'मेरे उत्पाद',
    'manage_products': 'आपके द्वारा प्रकाशित सभी उत्पादों को प्रबंधित करें।',
    'add_product': 'नया उत्पाद जोड़ें',

    // Artisan profile
    'my_profile': 'मेरी प्रोफ़ाइल',
    'profile_subtitle': 'खरीदारों को अपने शिल्प की कहानी बताएँ।',
    'my_store': 'मेरा स्टोर',
    'edit_profile': 'प्रोफ़ाइल संपादित करें',

    // Add product
    'add_product_title': 'उत्पाद जोड़ें',
    'create_listing': 'लिस्टिंग बनाएँ',
    'listing_subtitle': 'अपनी रचना के बारे में कुछ विवरण से शुरुआत करें।',
    'product_name': 'उत्पाद का नाम',
    'product_name_hint': 'उदा. हाथ से बुनी सूती साड़ी',
    'category': 'श्रेणी',
    'textiles': 'वस्त्र',
    'pottery': 'मिट्टी के बर्तन',
    'jewellery': 'आभूषण',
    'baskets': 'टोकरी',
    'wooden_craft': 'लकड़ी का शिल्प',
    'selling_price': 'आपका बिक्री मूल्य',
    'enter_price': 'अपनी कीमत दर्ज करें',
    'continue': 'जारी रखें',

    // Upload
    'product_photo': 'उत्पाद की तस्वीर',
    'show_craft': 'अपना शिल्प हमें दिखाएँ',
    'upload_subtitle':
        'एक स्पष्ट तस्वीर अपलोड करें। AI आपकी लिस्टिंग तैयार करेगा।',
    'add_product_photo': 'उत्पाद की तस्वीर जोड़ें',
    'photo_hint': 'JPG या PNG • स्पष्ट और अच्छी रोशनी में',
    'gallery': 'गैलरी',
    'camera': 'कैमरा',

    // Processing
    'preparing_listing': 'आपकी लिस्टिंग तैयार हो रही है',
    'understanding_craft':
        'तस्वीर को बेहतर बनाया जा रहा है और आपके शिल्प को समझा जा रहा है...',
    'preparing_image': 'उत्पाद की तस्वीर तैयार की जा रही है',
    'identifying_details': 'शिल्प के विवरण पहचाने जा रहे हैं',
    'creating_description': 'उत्पाद का विवरण बनाया जा रहा है',

    // AI results
    'ai_results': 'AI परिणाम',
    'found_details': 'हमें विवरण मिल गए',
    'review_ai':
        'अपनी लिस्टिंग बनाने से पहले AI द्वारा पहचानी गई जानकारी देखें।',
    'material': 'सामग्री',
    'craft_type': 'शिल्प का प्रकार',
    'colour': 'रंग',
    'pattern': 'पैटर्न',
    'traditional_pattern': 'पारंपरिक ज्यामितीय पैटर्न',
    'ai_confidence': 'AI विश्वसनीयता: उच्च\nप्रकाशित करने से पहले आप किसी भी विवरण को संपादित कर सकते हैं।',
    'review_listing': 'लिस्टिंग की समीक्षा करें',

    // Review
    'review_listing_title': 'लिस्टिंग की समीक्षा करें',
    'listing_title': 'लिस्टिंग का शीर्षक',
    'description': 'विवरण',
    'price': 'कीमत',
    'publish_product': 'उत्पाद प्रकाशित करें',

    // Success
    'product_live': 'आपका उत्पाद लाइव है!',
    'product_live_subtitle': 'अब खरीदार आपकी रचना को खोज सकते हैं।',
    'back_dashboard': 'डैशबोर्ड पर वापस जाएँ',

    // Buyer home
    'discover_meaningful': 'कुछ अर्थपूर्ण खोजें।',
    'authentic_products': 'वास्तविक लोगों द्वारा बनाए गए प्रामाणिक उत्पाद।',
    'search_products': 'उत्पाद या शिल्प खोजें',
    'explore_categories': 'श्रेणियाँ देखें',
    'featured_crafts': 'विशेष शिल्प',

    // Buyer search
    'find_products': 'उत्पाद, सामग्री और पारंपरिक शिल्प खोजें।',
    'search_handmade': 'हस्तनिर्मित उत्पाद खोजें...',

    // Buyer saved
    'saved_subtitle': 'आपकी पसंदीदा रचनाएँ एक ही जगह पर।',

    // Buyer profile
    'buyer_profile_subtitle': 'आपका Artisan मार्केटप्लेस खाता।',
    'personal_details': 'व्यक्तिगत विवरण',
    'my_orders': 'मेरे ऑर्डर',
    'saved_addresses': 'सहेजे गए पते',

    // Product details
    'about_craft': 'इस शिल्प के बारे में',
    'product_details': 'उत्पाद विवरण',
    'buy_now': 'अभी खरीदें',
    'by': 'द्वारा',
    'made_with_care': 'सावधानी से बनाया गया',
    'traditional_technique': 'पारंपरिक',
    'technique': 'तकनीक का उपयोग करके बनाया गया। हर रचना उस कारीगर की विशेषता को दर्शाती है जिसने इसे बनाया है।',

    // Product data
    'heritage_saree': 'हाथ से बुनी पारंपरिक साड़ी',
    'terracotta_pot': 'टेराकोटा पत्ती का बर्तन',
    'palm_basket': 'पाम लीफ टोकरी',
    'brass_earrings': 'पीतल के पारंपरिक झुमके',

    'meena_crafts': 'मीना क्राफ्ट्स',
    'kannan_pottery': 'कन्नन पॉटरी',
    'lakshmi_weaves': 'लक्ष्मी वीव्स',
    'ananya_studio': 'अनन्या स्टूडियो',

    'cotton': 'कपास',
    'clay': 'मिट्टी',
    'palm_leaf': 'पाम लीफ',
    'brass': 'पीतल',

    'handloom': 'हथकरघा',
    'terracotta': 'टेराकोटा',
    'handwoven': 'हाथ से बुना हुआ',
    'handcrafted': 'हस्तनिर्मित',

    'indigo': 'इंडिगो',
    'earth_red': 'मिट्टी लाल',
    'natural': 'प्राकृतिक',
    'gold': 'सोना',

    'handloom_artisan_tamil_nadu': 'हथकरघा कारीगर • तमिलनाडु',
  };
}

void main() => runApp(const ArtisanApp());

class AppColors {
  static const primary = Color(0xFF7A1F3D);
  static const deepPurple = Color(0xFF4A1025);
  static const lavender = Color(0xFFF3E6D3);
  static const cream = Color(0xFFFFF9F2);
  static const gold = Color(0xFFC8A45D);
  static const goldLight = Color(0xFFEAD9B8);
  static const maroon = Color(0xFF7A1F3D);
  static const text = Color(0xFF2D1B20);
  static const muted = Color(0xFF7B6870);
  static const border = Color(0xFFE3D5D8);
  static const green = Color(0xFF5F7658);
}

class ArtisanApp extends StatelessWidget {
  const ArtisanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: LanguageManager.current,
      builder: (context, language, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Artisan',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.cream,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.light,
            ),
            fontFamily: 'Arial',
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}

class Product {
  final String nameKey;
  final String categoryKey;
  final String artisanKey;
  final String materialKey;
  final String craftKey;
  final String colourKey;
  final double price;
  final IconData icon;

  const Product({
    required this.nameKey,
    required this.categoryKey,
    required this.artisanKey,
    required this.materialKey,
    required this.craftKey,
    required this.colourKey,
    required this.price,
    required this.icon,
  });

  String get name => AppText.get(nameKey);
  String get category => AppText.get(categoryKey);
  String get artisan => AppText.get(artisanKey);
  String get material => AppText.get(materialKey);
  String get craft => AppText.get(craftKey);
  String get colour => AppText.get(colourKey);
}

const products = <Product>[
  Product(
    nameKey: 'heritage_saree',
    categoryKey: 'textiles',
    artisanKey: 'meena_crafts',
    materialKey: 'cotton',
    craftKey: 'handloom',
    colourKey: 'indigo',
    price: 2850,
    icon: Icons.checkroom_rounded,
  ),
  Product(
    nameKey: 'terracotta_pot',
    categoryKey: 'pottery',
    artisanKey: 'kannan_pottery',
    materialKey: 'clay',
    craftKey: 'terracotta',
    colourKey: 'earth_red',
    price: 780,
    icon: Icons.local_florist_rounded,
  ),
  Product(
    nameKey: 'palm_basket',
    categoryKey: 'baskets',
    artisanKey: 'lakshmi_weaves',
    materialKey: 'palm_leaf',
    craftKey: 'handwoven',
    colourKey: 'natural',
    price: 620,
    icon: Icons.shopping_basket_rounded,
  ),
  Product(
    nameKey: 'brass_earrings',
    categoryKey: 'jewellery',
    artisanKey: 'ananya_studio',
    materialKey: 'brass',
    craftKey: 'handcrafted',
    colourKey: 'gold',
    price: 950,
    icon: Icons.diamond_rounded,
  ),
];

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1400), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LanguageSelectionScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(large: true, light: true),
            SizedBox(height: 18),
            Text(
              'Crafted with heritage.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                letterSpacing: .5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              const AppLogo(),

              const SizedBox(height: 45),

              Text(
                AppText.get('choose_language'),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepPurple,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                AppText.get('select_language'),
                style: const TextStyle(fontSize: 16, color: AppColors.muted),
              ),

              const SizedBox(height: 30),

              _languageButton(
                context,
                '🇬🇧',
                AppText.get('english'),
                AppLanguage.english,
              ),

              const SizedBox(height: 14),

              _languageButton(
                context,
                '🇮🇳',
                AppText.get('tamil'),
                AppLanguage.tamil,
              ),

              const SizedBox(height: 14),

              _languageButton(
                context,
                '🇮🇳',
                AppText.get('hindi'),
                AppLanguage.hindi,
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _languageButton(
    BuildContext context,
    String flag,
    String language,
    AppLanguage selectedLanguage,
  ) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          LanguageManager.changeLanguage(selectedLanguage);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const WelcomeScreen()),
          );
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 25)),
            const SizedBox(width: 16),
            Text(
              language,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.deepPurple,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.muted,
            ),
          ],
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  final bool large;
  final bool light;

  const AppLogo({super.key, this.large = false, this.light = false});

  @override
  Widget build(BuildContext context) {
    final size = large ? 62.0 : 42.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(large ? 18 : 13),
          ),
          child: Icon(
            Icons.handyman_rounded,
            color: AppColors.deepPurple,
            size: size * .55,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'ARTISAN',
          style: TextStyle(
            color: light ? Colors.white : AppColors.deepPurple,
            fontSize: large ? 26 : 20,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.2,
          ),
        ),
      ],
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const AppLogo(),
              const Spacer(),

              Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lavender,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Center(
                  child: Icon(
                    Icons.auto_awesome_rounded,
                    size: 88,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 34),

              Text(
                AppText.get('welcome_title'),
                style: const TextStyle(
                  fontSize: 38,
                  height: 1.08,
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepPurple,
                ),
              ),

              const SizedBox(height: 14),

              Text(
                AppText.get('welcome_subtitle'),
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: AppColors.muted,
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    AppText.get('get_started'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppText.get('learn_more'),
                    style: const TextStyle(color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool signup = false;
  bool obscure = true;

  void continueToApp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ChooseUserScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(26, 10, 26, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                signup
                    ? AppText.get('create_your_account')
                    : AppText.get('welcome_back'),
                style: const TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepPurple,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                signup
                    ? AppText.get('join_community')
                    : AppText.get('sign_in_marketplace'),
                style: const TextStyle(color: AppColors.muted, fontSize: 15),
              ),

              const SizedBox(height: 30),

              if (signup) ...[
                Text(
                  AppText.get('full_name'),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: AppText.get('enter_name'),
                  ),
                ),
                const SizedBox(height: 18),
              ],

              Text(
                AppText.get('email_address'),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 8),

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: AppText.get('email_hint'),
                ),
              ),

              const SizedBox(height: 18),

              Text(
                AppText.get('password'),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 8),

              TextField(
                obscureText: obscure,
                decoration: InputDecoration(
                  hintText: AppText.get('enter_password'),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => obscure = !obscure),
                    icon: Icon(
                      obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),

              if (!signup)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(AppText.get('forgot_password')),
                  ),
                ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: continueToApp,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    signup
                        ? AppText.get('create_account')
                        : AppText.get('sign_in'),
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    signup
                        ? AppText.get('already_account')
                        : AppText.get('dont_have_account'),
                  ),
                  TextButton(
                    onPressed: () => setState(() => signup = !signup),
                    child: Text(
                      signup
                          ? AppText.get('sign_in_small')
                          : AppText.get('sign_up'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseUserScreen extends StatelessWidget {
  const ChooseUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              Text(
                AppText.get('how_use_artisan'),
                style: const TextStyle(
                  fontSize: 34,
                  height: 1.1,
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepPurple,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                AppText.get('choose_experience'),
                style: const TextStyle(color: AppColors.muted, fontSize: 16),
              ),

              const SizedBox(height: 34),

              RoleCard(
                icon: Icons.handyman_rounded,
                title: AppText.get('i_am_artisan'),
                subtitle: AppText.get('artisan_subtitle'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ArtisanShell()),
                ),
              ),

              const SizedBox(height: 16),

              RoleCard(
                icon: Icons.shopping_bag_outlined,
                title: AppText.get('i_am_buyer'),
                subtitle: AppText.get('buyer_subtitle'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const BuyerShell()),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                color: AppColors.lavender,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Icon(icon, color: AppColors.maroon, size: 28),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.muted,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17,
              color: AppColors.muted,
            ),
          ],
        ),
      ),
    );
  }
}

class ArtisanShell extends StatefulWidget {
  const ArtisanShell({super.key});

  @override
  State<ArtisanShell> createState() => _ArtisanShellState();
}

class _ArtisanShellState extends State<ArtisanShell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      ArtisanDashboard(onAdd: () => setState(() => index = 1)),
      const ArtisanProducts(),
      const ArtisanProfile(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        backgroundColor: Colors.white,
        indicatorColor: AppColors.lavender,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard_outlined),
            selectedIcon: const Icon(Icons.dashboard_rounded),
            label: AppText.get('home'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.inventory_2_outlined),
            selectedIcon: const Icon(Icons.inventory_2_rounded),
            label: AppText.get('products'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline_rounded),
            selectedIcon: const Icon(Icons.person_rounded),
            label: AppText.get('profile'),
          ),
        ],
      ),
    );
  }
}

class ArtisanDashboard extends StatelessWidget {
  final VoidCallback onAdd;

  const ArtisanDashboard({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppLogo(),

            const SizedBox(height: 30),

            Text(
              AppText.get('good_evening'),
              style: const TextStyle(color: AppColors.muted),
            ),

            const SizedBox(height: 5),

            Text(
              AppText.get('grow_craft'),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.deepPurple,
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.deepPurple,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppText.get('ready_add'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppText.get('ai_listing'),
                          style: const TextStyle(
                            color: Colors.white70,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  IconButton.filled(
                    onPressed: onAdd,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.gold,
                      foregroundColor: AppColors.deepPurple,
                    ),
                    icon: const Icon(Icons.add_rounded, size: 28),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            SectionTitle(title: AppText.get('your_overview')),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: StatCard(number: '12', label: AppText.get('products')),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(number: '286', label: AppText.get('views')),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(number: '18', label: AppText.get('saved')),
                ),
              ],
            ),

            const SizedBox(height: 28),

            SectionTitle(title: AppText.get('recent_products')),

            const SizedBox(height: 12),

            ...products
                .take(2)
                .map(
                  (product) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProductListTile(product: product),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String number;
  final String label;

  const StatCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: AppColors.deepPurple,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? action;

  const SectionTitle({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        if (action != null)
          Text(
            action!,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }
}

class ProductListTile extends StatelessWidget {
  final Product product;

  const ProductListTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          ProductVisual(product: product, size: 72),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 5),
                Text(
                  product.category,
                  style: const TextStyle(color: AppColors.muted),
                ),
                const SizedBox(height: 7),
                Text(
                  '₹${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
        ],
      ),
    );
  }
}

class ProductVisual extends StatelessWidget {
  final Product product;
  final double size;

  const ProductVisual({super.key, required this.product, this.size = 150});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: AppColors.lavender,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(product.icon, size: size * .38, color: AppColors.primary),
    );
  }
}

class ArtisanProducts extends StatelessWidget {
  const ArtisanProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          PageTitle(
            title: AppText.get('my_products'),
            subtitle: AppText.get('manage_products'),
          ),

          const SizedBox(height: 22),

          FilledButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddProductScreen()),
            ),
            icon: const Icon(Icons.add_rounded),
            label: Text(AppText.get('add_product')),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),

          const SizedBox(height: 22),

          ...products.map(
            (product) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ProductListTile(product: product),
            ),
          ),
        ],
      ),
    );
  }
}

class ArtisanProfile extends StatelessWidget {
  const ArtisanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          PageTitle(
            title: AppText.get('my_profile'),
            subtitle: AppText.get('profile_subtitle'),
          ),

          const SizedBox(height: 25),

          Center(
            child: Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                color: AppColors.lavender,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_rounded,
                size: 48,
                color: AppColors.primary,
              ),
            ),
          ),

          const SizedBox(height: 14),

          Center(
            child: Text(
              AppText.get('meena_crafts'),
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
            ),
          ),

          const SizedBox(height: 5),

          Center(
            child: Text(
              AppText.get('handloom_artisan_tamil_nadu'),
              style: const TextStyle(color: AppColors.muted),
            ),
          ),

          const SizedBox(height: 30),

          ProfileOption(
            icon: Icons.storefront_outlined,
            title: AppText.get('my_store'),
            onTap: () {},
          ),

          ProfileOption(
            icon: Icons.edit_outlined,
            title: AppText.get('edit_profile'),
            onTap: () {},
          ),

          ProfileOption(
            icon: Icons.language_rounded,
            title: AppText.get('language'),
            onTap: () => showLanguageDialog(context),
          ),

          ProfileOption(
            icon: Icons.help_outline_rounded,
            title: AppText.get('help'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppText.get('choose_language')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Text('🇬🇧'),
                title: Text(AppText.get('english')),
                onTap: () {
                  LanguageManager.changeLanguage(AppLanguage.english);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Text('🇮🇳'),
                title: Text(AppText.get('tamil')),
                onTap: () {
                  LanguageManager.changeLanguage(AppLanguage.tamil);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Text('🇮🇳'),
                title: Text(AppText.get('hindi')),
                onTap: () {
                  LanguageManager.changeLanguage(AppLanguage.hindi);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 3),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.lavender,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primary),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
      onTap: onTap,
    );
  }
}

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppText.get('add_product_title'))),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(
              title: AppText.get('create_listing'),
              subtitle: AppText.get('listing_subtitle'),
            ),

            const SizedBox(height: 25),

            Text(
              AppText.get('product_name'),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 8),

            TextField(
              decoration: InputDecoration(
                hintText: AppText.get('product_name_hint'),
              ),
            ),

            const SizedBox(height: 18),

            Text(
              AppText.get('category'),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              initialValue: 'Textiles',
              items: [
                DropdownMenuItem(
                  value: 'Textiles',
                  child: Text(AppText.get('textiles')),
                ),
                DropdownMenuItem(
                  value: 'Pottery',
                  child: Text(AppText.get('pottery')),
                ),
                DropdownMenuItem(
                  value: 'Jewellery',
                  child: Text(AppText.get('jewellery')),
                ),
                DropdownMenuItem(
                  value: 'Baskets',
                  child: Text(AppText.get('baskets')),
                ),
                DropdownMenuItem(
                  value: 'Wooden Craft',
                  child: Text(AppText.get('wooden_craft')),
                ),
              ],
              onChanged: (_) {},
            ),

            const SizedBox(height: 18),

            Text(
              AppText.get('selling_price'),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 8),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: '₹ ',
                hintText: AppText.get('enter_price'),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UploadPhotoScreen()),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(AppText.get('continue')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppText.get('product_photo'))),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 10),

            PageTitle(
              title: AppText.get('show_craft'),
              subtitle: AppText.get('upload_subtitle'),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_a_photo_outlined,
                      size: 60,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppText.get('add_product_photo'),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      AppText.get('photo_hint'),
                      style: const TextStyle(color: AppColors.muted),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();

                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );

                      if (image != null) {
                        final Uint8List imageBytes = await image.readAsBytes();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProcessingScreen(imageBytes: imageBytes),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.photo_library_outlined),
                    label: Text(AppText.get('gallery')),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: FilledButton.icon(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();

                      final XFile? image = await picker.pickImage(
                        source: ImageSource.camera,
                      );

                      if (image != null) {
                        final Uint8List imageBytes = await image.readAsBytes();

                        if (!mounted) return;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProcessingScreen(imageBytes: imageBytes),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: Text(AppText.get('camera')),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProcessingScreen extends StatefulWidget {
  final Uint8List? imageBytes;

  const ProcessingScreen({super.key, this.imageBytes});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  final AIService _aiService = AIService();

  String currentStep = 'Preparing image...';

  @override
  void initState() {
    super.initState();
    _runAI();
  }

  Future<void> _runAI() async {
    try {
      setState(() {
        currentStep = 'Loading AI model...';
      });

      if (widget.imageBytes == null) {
        throw Exception('No image was selected.');
      }

      await _aiService.loadModel();

      setState(() {
        currentStep = 'Identifying your craft...';
      });

      final AIResult result = await _aiService.analyzeImage(widget.imageBytes!);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => AIResultsScreen(
            imageBytes: widget.imageBytes,
            aiLabel: result.label,
            aiConfidence: result.confidence,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('AI processing failed: $e')));
    }
  }

  @override
  void dispose() {
    _aiService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 105,
                width: 105,
                decoration: const BoxDecoration(
                  color: AppColors.lavender,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Text(
                AppText.get('preparing_listing'),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                currentStep,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.muted, height: 1.5),
              ),

              const SizedBox(height: 25),

              ProcessingStep(
                icon: Icons.auto_fix_high_rounded,
                text: 'Preparing image',
              ),

              ProcessingStep(
                icon: Icons.search_rounded,
                text: 'Identifying craft',
              ),

              ProcessingStep(
                icon: Icons.description_outlined,
                text: 'Creating listing details',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProcessingStep extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProcessingStep({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 19, color: AppColors.maroon),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: AppColors.muted)),
        ],
      ),
    );
  }
}

class AIResultsScreen extends StatefulWidget {
  final Uint8List? imageBytes;
  final String? aiLabel;
  final double? aiConfidence;

  const AIResultsScreen({
    super.key,
    this.imageBytes,
    this.aiLabel,
    this.aiConfidence,
  });

  @override
  State<AIResultsScreen> createState() => _AIResultsScreenState();
}

class _AIResultsScreenState extends State<AIResultsScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();

  bool _isListening = false;
  bool _speechAvailable = false;

  String _selectedLanguage = 'en-IN';
  String _detectedLanguage = 'English';

  final TextEditingController _voiceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  Future<void> _initializeSpeech() async {
    _speechAvailable = await _speech.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _startListening() async {
    if (!_speechAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Speech recognition is not available.')),
      );
      return;
    }

    await _speech.listen(
      localeId: _selectedLanguage,
      onResult: (result) {
        setState(() {
          _voiceController.text = result.recognizedWords;
        });
      },
    );

    setState(() {
      _isListening = true;
    });
  }

  Future<void> _stopListening() async {
    await _speech.stop();

    setState(() {
      _isListening = false;
    });
  }

  void _changeLanguage(String languageCode) {
    setState(() {
      _selectedLanguage = languageCode;

      if (languageCode == 'ta-IN') {
        _detectedLanguage = 'Tamil';
      } else if (languageCode == 'hi-IN') {
        _detectedLanguage = 'Hindi';
      } else {
        _detectedLanguage = 'English';
      }
    });
  }

  @override
  void dispose() {
    _speech.stop();
    _voiceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'AI Product Details',
          style: TextStyle(color: AppColors.text, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- PRODUCT PHOTO ----------------

            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lavender,
                borderRadius: BorderRadius.circular(20),
              ),
              child: widget.imageBytes != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.memory(
                        widget.imageBytes!,
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Icon(
                      Icons.image_outlined,
                      size: 80,
                      color: AppColors.primary,
                    ),
            ),

            const SizedBox(height: 24),

            Text(
              '✨ AI detected: ${widget.aiLabel ?? 'Unknown'}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'AI confidence: ${((widget.aiConfidence ?? 0) * 100).toStringAsFixed(1)}%',
              style: TextStyle(fontSize: 15, color: AppColors.muted),
            ),
            const SizedBox(height: 8),

            const Text(
              'Add more details about your product using your voice.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.muted),
            ),

            const SizedBox(height: 24),

            // ---------------- LANGUAGE ----------------
            const Text(
              'Speak in',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                _languageButton('English', 'en-IN'),
                const SizedBox(width: 8),
                _languageButton('தமிழ்', 'ta-IN'),
                const SizedBox(width: 8),
                _languageButton('हिंदी', 'hi-IN'),
              ],
            ),

            const SizedBox(height: 24),

            // ---------------- MICROPHONE ----------------
            Center(
              child: GestureDetector(
                onTap: () {
                  if (_isListening) {
                    _stopListening();
                  } else {
                    _startListening();
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: _isListening
                        ? Colors.red.shade100
                        : AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(
                    _isListening ? Icons.stop : Icons.mic,
                    size: 42,
                    color: _isListening ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Center(
              child: Text(
                _isListening ? 'Listening...' : 'Tap to speak',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _isListening ? Colors.red : AppColors.text,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ---------------- TEXT BOX ----------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.border),
              ),
              child: TextField(
                controller: _voiceController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Your spoken details will appear here...',
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ---------------- LANGUAGE DETECTED ----------------
            Row(
              children: [
                const Icon(Icons.language, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Language: $_detectedLanguage',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ---------------- GENERATE BUTTON ----------------
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ReviewListingScreen(
                        imageBytes: widget.imageBytes,
                        spokenDetails: _voiceController.text,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Generate Details →',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _languageButton(String title, String languageCode) {
    final bool selected = _selectedLanguage == languageCode;

    return Expanded(
      child: GestureDetector(
        onTap: () => _changeLanguage(languageCode),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : AppColors.text,
            ),
          ),
        ),
      ),
    );
  }
}

class ResultChip extends StatelessWidget {
  final String label;
  final String value;

  const ResultChip({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.muted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

class ReviewListingScreen extends StatefulWidget {
  final Uint8List? imageBytes;
  final String? spokenDetails;

  const ReviewListingScreen({super.key, this.imageBytes, this.spokenDetails});

  @override
  State<ReviewListingScreen> createState() => _ReviewListingScreenState();
}

class _ReviewListingScreenState extends State<ReviewListingScreen> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(
      text: 'Handwoven Heritage Cotton Saree',
    );

    descriptionController = TextEditingController(
      text:
          widget.spokenDetails != null &&
              widget.spokenDetails!.trim().isNotEmpty
          ? widget.spokenDetails!
          : 'A beautifully handwoven cotton saree inspired by traditional textile heritage. Crafted with care and designed for everyday elegance.',
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = products.first;

    return Scaffold(
      appBar: AppBar(title: Text(AppText.get('review_listing_title'))),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          Container(
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lavender,
              borderRadius: BorderRadius.circular(20),
            ),
            child: widget.imageBytes != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.memory(
                      widget.imageBytes!,
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(
                    Icons.image_outlined,
                    size: 80,
                    color: AppColors.primary,
                  ),
          ),

          const SizedBox(height: 22),

          Text(
            AppText.get('listing_title'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 8),

          TextField(controller: titleController),

          const SizedBox(height: 18),

          Text(
            AppText.get('description'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 8),

          TextField(controller: descriptionController, maxLines: 6),

          const SizedBox(height: 18),

          Text(
            AppText.get('price'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 8),

          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(prefixText: '₹ ', hintText: '2850'),
          ),

          const SizedBox(height: 26),

          FilledButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const PublishSuccessScreen()),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 17),
            ),
            child: Text(AppText.get('publish_product')),
          ),
        ],
      ),
    );
  }
}

class PublishSuccessScreen extends StatelessWidget {
  const PublishSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 92,
                width: 92,
                decoration: const BoxDecoration(
                  color: AppColors.goldLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 50,
                  color: AppColors.maroon,
                ),
              ),

              const SizedBox(height: 25),

              Text(
                AppText.get('product_live'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepPurple,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                AppText.get('product_live_subtitle'),
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.muted, height: 1.5),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const ArtisanShell()),
                    (route) => false,
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 17),
                  ),
                  child: Text(AppText.get('back_dashboard')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyerShell extends StatefulWidget {
  const BuyerShell({super.key});

  @override
  State<BuyerShell> createState() => _BuyerShellState();
}

class _BuyerShellState extends State<BuyerShell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      BuyerHome(onSearch: () => setState(() => index = 1)),
      const BuyerSearch(),
      const BuyerSaved(),
      const BuyerProfile(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        backgroundColor: Colors.white,
        indicatorColor: AppColors.lavender,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_rounded),
            label: AppText.get('home'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.search_rounded),
            label: AppText.get('search'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.bookmark_border_rounded),
            selectedIcon: const Icon(Icons.bookmark_rounded),
            label: AppText.get('saved'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline_rounded),
            selectedIcon: const Icon(Icons.person_rounded),
            label: AppText.get('profile'),
          ),
        ],
      ),
    );
  }
}

class BuyerHome extends StatelessWidget {
  final VoidCallback onSearch;

  const BuyerHome({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 30),
        children: [
          const AppLogo(),

          const SizedBox(height: 28),

          Text(
            AppText.get('discover_meaningful'),
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w800,
              color: AppColors.deepPurple,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            AppText.get('authentic_products'),
            style: const TextStyle(color: AppColors.muted),
          ),

          const SizedBox(height: 22),

          InkWell(
            onTap: onSearch,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search_rounded, color: AppColors.muted),
                  const SizedBox(width: 10),
                  Text(
                    AppText.get('search_products'),
                    style: const TextStyle(color: AppColors.muted),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 27),

          SectionTitle(title: AppText.get('explore_categories')),

          const SizedBox(height: 13),

          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryItem(
                  icon: Icons.checkroom_rounded,
                  label: AppText.get('textiles'),
                ),
                CategoryItem(
                  icon: Icons.local_florist_rounded,
                  label: AppText.get('pottery'),
                ),
                CategoryItem(
                  icon: Icons.shopping_basket_rounded,
                  label: AppText.get('baskets'),
                ),
                CategoryItem(
                  icon: Icons.diamond_rounded,
                  label: AppText.get('jewellery'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 27),

          SectionTitle(title: AppText.get('featured_crafts')),

          const SizedBox(height: 13),

          SizedBox(
            height: 285,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (context, index) => const SizedBox(width: 14),
              itemBuilder: (context, index) =>
                  BuyerProductCard(product: products[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class BuyerProductCard extends StatelessWidget {
  final Product product;

  const BuyerProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: product),
        ),
      ),
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 205,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductVisual(product: product, size: 205),

            const SizedBox(height: 10),

            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),

            const SizedBox(height: 4),

            Text(
              product.artisan,
              style: const TextStyle(color: AppColors.muted, fontSize: 13),
            ),

            const SizedBox(height: 5),

            Text(
              '₹${product.price.toStringAsFixed(0)}',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 30),
        children: [
          ProductVisual(product: product, size: 280),

          const SizedBox(height: 22),

          Text(
            product.category.toUpperCase(),
            style: const TextStyle(
              color: AppColors.maroon,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            product.name,
            style: const TextStyle(
              fontSize: 29,
              height: 1.15,
              fontWeight: FontWeight.w800,
              color: AppColors.deepPurple,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            '${AppText.get('by')} ${product.artisan}',
            style: const TextStyle(color: AppColors.muted),
          ),

          const SizedBox(height: 18),

          Text(
            '₹${product.price.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 25,
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 22),

          Text(
            AppText.get('about_craft'),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 8),

          Text(
            '${AppText.get('made_with_care')} ${product.material} ${AppText.get('traditional_technique')} ${product.craft} ${AppText.get('technique')}',
            style: const TextStyle(
              color: AppColors.muted,
              height: 1.55,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 24),

          SectionTitle(title: AppText.get('product_details')),

          const SizedBox(height: 12),

          ResultChip(label: AppText.get('material'), value: product.material),

          ResultChip(label: AppText.get('craft_type'), value: product.craft),

          ResultChip(label: AppText.get('colour'), value: product.colour),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 17),
              ),
              child: Text(AppText.get('buy_now')),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyerSearch extends StatelessWidget {
  const BuyerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          PageTitle(
            title: AppText.get('search'),
            subtitle: AppText.get('find_products'),
          ),

          const SizedBox(height: 22),

          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_rounded),
              hintText: AppText.get('search_handmade'),
            ),
          ),

          const SizedBox(height: 22),

          ...products.map(
            (product) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ProductListTile(product: product),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyerSaved extends StatelessWidget {
  const BuyerSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          PageTitle(
            title: AppText.get('saved'),
            subtitle: AppText.get('saved_subtitle'),
          ),

          const SizedBox(height: 25),

          ...products
              .take(2)
              .map(
                (product) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ProductListTile(product: product),
                ),
              ),
        ],
      ),
    );
  }
}

class BuyerProfile extends StatelessWidget {
  const BuyerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          PageTitle(
            title: AppText.get('my_profile'),
            subtitle: AppText.get('buyer_profile_subtitle'),
          ),

          const SizedBox(height: 25),

          ProfileOption(
            icon: Icons.person_outline_rounded,
            title: AppText.get('personal_details'),
            onTap: _empty,
          ),

          ProfileOption(
            icon: Icons.shopping_bag_outlined,
            title: AppText.get('my_orders'),
            onTap: _empty,
          ),

          ProfileOption(
            icon: Icons.location_on_outlined,
            title: AppText.get('saved_addresses'),
            onTap: _empty,
          ),

          ProfileOption(
            icon: Icons.help_outline_rounded,
            title: AppText.get('help'),
            onTap: _empty,
          ),
        ],
      ),
    );
  }
}

void _empty() {}

class PageTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const PageTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: AppColors.deepPurple,
          ),
        ),

        const SizedBox(height: 7),

        Text(
          subtitle,
          style: const TextStyle(color: AppColors.muted, height: 1.45),
        ),
      ],
    );
  }
}
