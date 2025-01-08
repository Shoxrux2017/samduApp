import 'dart:io';

// abstract class Configuration {
//   late String _baseURL;

//   String get baseURL => _baseURL;

//   void baseUrl(){
//     if(Platform.isWindows){
//       _baseURL =
//     }
//   }
// }

// class Test {
//   void testFunc() {
//     if (Platform.isAndroid) ;
//   }
// }

Object baseURL = Platform.isWindows
    ? baseURL = 'http://127.0.0.1:8000/api'
    : Platform.isAndroid
        ? baseURL = 'http://10.0.2.2:8000/api'
        : 0;

// var loginURL = '$baseURL/login';

//  baseURL = 'http://10.0.2.2:8000/api';
// const baseURLForWindows = 'http://127.0.0.1:8000/api';

var loginURL = '$baseURL/login';
var registerURL = '$baseURL/register';
var logoutURL = '$baseURL/logout';
var userURL = '$baseURL/user';

var downloadYuklamaUrl = '$baseURL/downloadFile';
// var uploadYuklamaUrlForWindows = '$baseURLForWindows/upload-file';
var uploadYuklamaUrl = '$baseURL/upload-file';
var uploadIlmiyIshUrl = '$baseURL/ilmiy-ish';
var uploadOquvUslubiyIshUrl = '$baseURL/oquvUslubiyIsh';
var getScienceCategoryUrl = '$baseURL/science-category';
var getIlmiyIshUrl = '$baseURL/ilmiyIsh';
var searchIlmiyIshUrl = '$baseURL/searchIlmiyIsh';
var getOquvUslubiyIshUrl = '$baseURL/uslubiyIsh';
var searchOquvUslubiyIshUrl = '$baseURL/searchOquvUslubiyIsh';

var getPublishTypeUrl = '$baseURL/publish-type';
var getPublishLevelUrl = '$baseURL/publish-level';

var getUslubiyNashrTuriUrl = '$baseURL/uslubiyNashTuri';

var getOquvYiliUrl = '$baseURL/oquvYili';
var getNashrYiliUrl = '$baseURL/nashrYili';
var getNashrTiliUrl = '$baseURL/nashrTili';

var deleteNamunaviy = '$baseURL/deleteFile';
// const postsURL = '$baseURL/posts';
// const postFileURL = '$baseURL/post-file';
// const commentsURL = '$baseURL/comments';
var fakultetURL = '$baseURL/fakultet';
var kafedraURL = '$baseURL/kafedra';
var teacherURL = '$baseURL/teacher';
var checkingFileUrl = '$baseURL/checkingFile';
var deleteFile = '$baseURL/deleteFile';
var saveAvatarImage = '$baseURL/saveAvatarImg';

//Get books from library

var getBooksUrl = 'http://10.0.2.2:8000/api/users-library';

// const userImageUrl = 'http://10.0.2.2:8000';

Object userImageUrl = Platform.isWindows
    ? userImageUrl = 'http://127.0.0.1:8000'
    : Platform.isAndroid
        ? userImageUrl = 'http://10.0.2.2:8000'
        : 0;

// my-consts

const namunaviyTitle = 'namunaviy';
const sillabusTitle = 'sillabus';
const yuklamaTitle = 'yuklama';

// ----- Errors -----
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';

const fileExist = 'File exist.';
const fileNotFound = 'File not found.';
