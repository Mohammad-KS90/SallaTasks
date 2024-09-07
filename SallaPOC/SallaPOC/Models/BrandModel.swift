//
//  BrandModel.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 05/09/2024.
//

import Foundation

struct Prand: Decodable, Identifiable {
    let id: String
    let name: String
    let price: Double
}

struct Product: Decodable, Identifiable {
    let id: String
    let name: String?
    let description: String?
    let price: Double?
    let currency: String?
}


//
//"status": 200,
//    "success": true,
//    "data": [
//        {
//            "id": "599203108",
//            "name": "مع حقول مخصصة",
//            "description": null,
//            "url": "https://jalmatari.com/ar/NKRoQbq",
//            "promotion_title": "",
//            "subtitle": "",
//            "type": "product",
//            "status": "sale",
//            "weight": null,
//            "calories": 0,
//            "sku": null,
//            "rating": null,
//            "quantity": null,
//            "sold_quantity": 34,
//            "max_quantity": null,
//            "is_taxable": true,
//            "category": {
//                "name": null,
//                "url": null
//            },
//            "image": {
//                "url": "https://cdn.salla.sa/ydZbx/73dc7c69-5797-497e-ab62-76382dd43619-350.06784260516x500-KoNbg8Xf84F5Z3nsV5h8IJWuYbzyc0sHQ6UohJNc.jpg"
//            },
//            "brand": {
//                "id": "99911771",
//                "url": null,
//                "name": null
//            },
//            "tags": [],
//            "can_add_note": false,
//            "can_upload_file": false,
//            "is_on_sale": false,
//            "is_hidded_quantity": false,
//            "is_available": true,
//            "is_donation": false,
//            "is_out_of_stock": false,
//            "is_require_shipping": true,
//            "regular_price": 115,
//            "price": 115,
//            "sale_price": null,
//            "starting_price": null,
//            "currency": "SAR",
//            "mpn": null,
//            "gtin": null,
//            "discount_ends": null,
//            "has_options": false,
//            "pinned": true,
//            "mahly_category_id": null,
//            "spam_status": 0,
//            "custom_url": ""
//        },
//        {
//            "id": "304266723",
//            "name": "توكة تنعيم",
//            "description": null,
//            "url": "https://jalmatari.com/ar/xAeVqBb",
//            "promotion_title": "",
//            "subtitle": "غطاء حماية مذهل للهاتف",
//            "type": "codes",
//            "status": "sale",
//            "weight": null,
//            "calories": null,
//            "sku": null,
//            "rating": null,
//            "quantity": null,
//            "sold_quantity": 4,
//            "max_quantity": null,
//            "is_taxable": true,
//            "category": {
//                "name": null,
//                "url": null
//            },
//            "image": {
//                "url": "https://cdn.salla.sa/ydZbx/8f14a689-99d5-4df7-bfe8-0f1568383963-500x341.83673469388-kmz8WtSQD5xNXY3SIhk4LG6ZvyQaWw6zyOmFO8MV.png"
//            },
//            "brand": {
//                "id": null,
//                "url": null,
//                "name": null
//            },
//            "tags": [],
//            "can_add_note": false,
//            "can_upload_file": false,
//            "is_on_sale": false,
//            "is_hidded_quantity": false,
//            "is_available": true,
//            "is_donation": false,
//            "is_out_of_stock": false,
//            "is_require_shipping": false,
//            "regular_price": 115,
//            "price": 115,
//            "sale_price": null,
//            "starting_price": 11.5,
//            "currency": "SAR",
//            "mpn": null,
//            "gtin": null,
//            "discount_ends": null,
//            "has_options": true,
//            "pinned": true,
//            "mahly_category_id": null,
//            "spam_status": 0,
//            "custom_url": ""
//        },
//        {
//            "id": "879186968",
//            "name": "Aliqua usque cupio candidus deprimo.",
//            "description": "Sublime iusto amissio ambulo vis comparo aliqua. Vaco utique subito spes. Bibo desolo vis coma ullus.",
//            "url": "https://jalmatari.com/ar/BrOKxQr",
//            "promotion_title": "urbanus eveniet",
//            "subtitle": "",
//            "type": "product",
//            "status": "sale",
//            "weight": null,
//            "calories": null,
//            "sku": "mUbCAZeLbzcBdthoGOEOWrTJGMYmMIMRHdgFLtXRbMioyzEHnprkoQuCRRFuzXRRVzgLNQILSxEjJBUeGatHmgrKxEcMgtjbcaekGTOiHrCWchzOWRCCxzBjnafsLgrdAEpzdfQSeysPnFDFJodXF",
//            "rating": null,
//            "quantity": null,
//            "sold_quantity": null,
//            "max_quantity": null,
//            "is_taxable": true,
//            "category": {
//                "name": "codes",
//                "url": null
//            },
//            "image": {
//                "url": "https://wiremock.org/images/wireMockLogo.png"
//            },
//            "brand": {
//                "id": "259940351",
//                "url": null,
//                "name": "Armani"
//            },
//            "tags": [
//                {
//                    "name": "عطر",
//                    "url": null
//                },
//                {
//                    "name": "عطرين",
//                    "url": null
//                },
//                {
//                    "name": "لول",
//                    "url": null
//                },
//                {
//                    "name": "تستطيع أن",
//                    "url": null
//                },
//                {
//                    "name": "مسك",
//                    "url": null
//                },
//                {
//                    "name": "kkk",
//                    "url": null
//                },
//                {
//                    "name": "فواحة",
//                    "url": null
//                },
//                {
//                    "name": "klk",
//                    "url": null
//                },
//                {
//                    "name": "Cream",
//                    "url": null
//                },
//                {
//                    "name": "هدية",
//                    "url": null
//                },
//                {
//                    "name": "hair",
//                    "url": null
//                },
//                {
//                    "name": "نسائي",
//                    "url": null
//                },
//                {
//                    "name": "اختبار",
//                    "url": null
//                },
//                {
//                    "name": "long hair",
//                    "url": null
//                },
//                {
//                    "name": "عنبر",
//                    "url": null
//                }
//            ],
//            "can_add_note": false,
//            "can_upload_file": false,
//            "is_on_sale": false,
//            "is_hidded_quantity": false,
//            "is_available": true,
//            "is_donation": false,
//            "is_out_of_stock": false,
//            "is_require_shipping": true,
//            "regular_price": 1081,
//            "price": 1081,
//            "sale_price": null,
//            "starting_price": null,
//            "currency": "SAR",
//            "mpn": null,
//            "gtin": null,
//            "discount_ends": null,
//            "has_options": false,
//            "pinned": false,
//            "mahly_category_id": null,
//            "spam_status": 0,
//            "custom_url": ""
//        },
//        {
//            "id": "2043948566",
//            "name": "Generic Steel Tuna",
//            "description": "Acies clibanus dolor statim quibusdam vomer tam. Derelinquo vulgaris vesco utique appono. Correptius ago compello vulgivagus tabella dolorem casso benigne cernuus cogito. Calculus absque error acerbitas cupiditate asper coniecto cupiditate xiphias. Aiunt vomica centum pel allatus aspicio tollo fugit. Compono quia compello amita calco. Sto vix nihil tepesco vulgaris ex tonsor vorago compello. Commodi unus careo coma unde adiuvo varius ut. Commemoro ducimus validus clarus cognomen aggredior atrocitas quo corrigo utilis. Cultura curriculum basium nesciunt illo appello tenuis. Conturbo coerceo vis cunctatio distinctio. Suscipio atque cognomen tendo pecto alter arcus vociferor. Voluptatum modi uberrime spoliatio id conculco debilito conor. Defero cuius conor. Supplanto arcesso validus deputo quia demonstro utilis placeat. Cibus labore tertius caveo defendo in. Eaque solium ante verbera delectus. Placeat capillus bis perferendis. Dolor claustrum venia perferendis. Valde suffragium ambulo crastinus confero creptio. Accusantium cerno texo cetera cunae averto quo delego abundans. Velut desipio demergo tero nostrum. Terreo thesaurus vado nulla advoco caterva cunabula tracto. Approbo mollitia cibus trado labore antepono quae. Conitor tracto surgo careo temeritas somnus repellat tricesimus summa. Acervus patrocinor sonitus via. Amicitia ullus cunae studio artificiose campana aranea vox tenus. Quo eaque abstergo acies comprehendo somniculosus tubineus. Ambitus vulgaris abduco coruscus aggredior conforto damnatio. Voveo ver commodo decens tenetur capillus vilis abduco apud. Crux dolorem celebrer. Labore vapulus tersus vitium solio somnus uxor crudelis uberrime.",
//            "url": "https://jalmatari.com/ar/ZYbGeZp",
//            "promotion_title": "ventus turpis",
//            "subtitle": "",
//            "type": "product",
//            "status": "sale",
//            "weight": null,
//            "calories": null,
//            "sku": "yPtIuyxWpsrlRzYwTBstEYqusjRxSCtXEvvhNieyxBDwyFEzQCscOPDivocxWkrGqgTFYj",
//            "rating": null,
//            "quantity": null,
//            "sold_quantity": null,
//            "max_quantity": null,
//            "is_taxable": true,
//            "category": {
//                "name": null,
//                "url": null
//            },
//            "image": {
//                "url": "https://cdn.salla.sa/ydZbx/59a299dc-c60e-4923-a9ae-b27b0ca21006-500x430.31784841076-pvBCyzNVrQ5AesbFMAuxxD3V4YmMWLj8nk6Me55u.jpg"
//            },
//            "brand": {
//                "id": null,
//                "url": null,
//                "name": null
//            },
//            "tags": [],
//            "can_add_note": false,
//            "can_upload_file": false,
//            "is_on_sale": false,
//            "is_hidded_quantity": true,
//            "is_available": true,
//            "is_donation": false,
//            "is_out_of_stock": false,
//            "is_require_shipping": true,
//            "regular_price": 1116.65,
//            "price": 1116.65,
//            "sale_price": null,
//            "starting_price": null,
//            "currency": "SAR",
//            "mpn": null,
//            "gtin": null,
//            "discount_ends": null,
//            "has_options": false,
//            "pinned": false,
//            "mahly_category_id": null,
//            "spam_status": 0,
//            "custom_url": ""
//        },
//        {
//            "id": "1378017300",
//            "name": "Intelligent Fresh Computer",
//            "description": "Blanditiis vomer pecco acies. Animi abutor vae amo carus adamo amicitia. Adeptio aeger a vitium. Tardus timidus contabesco tondeo inflammatio. Abundans vociferor administratio eveniet delibero arcus tonsor. Dedico iure cometes curia amo conqueror adfectus vomer. Communis volubilis ait astrum terminatio debeo curvo. Ventus complectus repellendus avaritia depulso vulgaris voco defungo. Cruentus vulariter adeo thorax capio aveho. Cognomen sto suscipio aestivus velociter cuppedia vinco. Beatus umquam vitium comburo corrumpo cometes conatus celo cubicularis verbera. Dedecor ascisco aetas tersus tenetur vita. Sint trado solium sufficio pel cresco advoco capitulus pectus. Vinco solium absum in absque texo attollo arceo. Curto cunctatio aegre cervus. Vomito minima armarium ascit amita bardus aeneus argentum. Dolor defetiscor sollicito cunabula. Vilicus validus tot appono arto suus sperno amplus. Animi virtus totidem adfero admoveo umbra cui sto. Fugit modi ascit commemoro complectus tabgo minus aeger tondeo. Apto quidem comedo terra decipio. Aspernatur cubicularis cunae amoveo tollo adsuesco auxilium arx vaco baiulus. Tot demitto uterque adeptio. Cubicularis territo ex quos adiuvo auxilium varius defendo catena vulnero. Aureus tergum amicitia verto totidem vinitor acsi. Tabernus delicate blanditiis amet aegre. Causa numquam umerus causa. Adfectus cursus demonstro suus tego fugit arma taceo appositus eaque. Corroboro sum cotidie versus titulus amicitia turbo vigilo. Decet tenuis stabilis nemo carcer. Trucido velociter vitium subvenio alter dedecor thesaurus amicitia supplanto. Tepesco caterva atrox. Vomito triduana velociter victoria amor facere admiratio talus amor tubineus. Unde creator tero auditor ipsum tepesco alioqui distinctio amo. Vivo vehemens toties caecus strues.",
//            "url": "https://jalmatari.com/ar/qQmqoKm",
//            "promotion_title": "vix aeneus",
//            "subtitle": "",
//            "type": "service",
//            "status": "sale",
//            "weight": null,
//            "calories": null,
//            "sku": "CdcZzNBCKhMrfycLKXquaaHSPkEOwGsDRUYwlEVZENMJdzoCscdyOyccodbZagENCjBWSwTqJAegyGEWLXeXwzaiIMPwcKOdSXsuaFzfACMcRcYzLvmWD",
//            "rating": null,
//            "quantity": null,
//            "sold_quantity": null,
//            "max_quantity": null,
//            "is_taxable": true,
//            "category": {
//                "name": null,
//                "url": null
//            },
//            "image": {
//                "url": "https://wiremock.org/images/wireMockLogo.png"
//            },
//            "brand": {
//                "id": null,
//                "url": null,
//                "name": null
//            },
//            "tags": [],
//            "can_add_note": false,
//            "can_upload_file": false,
//            "is_on_sale": false,
//            "is_hidded_quantity": true,
//            "is_available": true,
//            "is_donation": false,
//            "is_out_of_stock": false,
//            "is_require_shipping": true,
//            "regular_price": 485.3,
//            "price": 485.3,
//            "sale_price": null,
//            "starting_price": null,
//            "currency": "SAR",
//            "mpn": null,
//            "gtin": null,
//            "discount_ends": null,
//            "has_options": false,
//            "pinned": false,
//            "mahly_category_id": null,
//            "spam_status": 0,
//            "custom_url": ""
//        }
//    ],
//    "filters": null,
//    "cursor": {
//        "current": "2",
//        "next": "https://api.salla.dev/store/v1/brands/1724782240?page=3&per_page=5&cursor=9c9df6bbde994714bac469df0434e86e%3AwL%2BJLNqY%2B4BRbcuCfCkqvz8sD4TLTPP38sBeZJ3vLOuplP8Ve6SD3G2JSg0yRe9KQydZTKP0FSd0v503BQU6%2FUU3ZK9LktX4Sc%2FYOFG%2FQKbn5VllJ6hsAZz7UKcTmDYukTKShGl5h1TEFpTZwrh2VVUn2WbcxxXcfbaUztvzbFcJ4I5YPlcBdNyHMRFENUsYKkLuBAckyJ1DvAPWXf%2BN8x47gLjly51Vr37KFGObcaMudZaRjZx9HB6iHh%2F2hkowOp3X%2BBiIXibXn53ziFy0pA%3D%3D"
//    }
