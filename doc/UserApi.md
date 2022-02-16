# openapi.api.UserApi

## Load the API package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

All URIs are relative to *http://127.0.0.1:8912*

Method | Description
------------- | -------------
[**checkTokenValidity**](UserApi.md#checktokenvalidity) | Check token validity for a user.
[**createOrModifyUser**](UserApi.md#createormodifyuser) | Create a new user or modify an existing one.
[**createToken**](UserApi.md#createtoken) | Create a token for a user.
[**deleteUser**](UserApi.md#deleteuser) | Delete an existing user.
[**filterUsers**](UserApi.md#filterusers) | Load users from the database by filtering them using the provided Filter.
[**getLoggedUser**](UserApi.md#getloggeduser) | Get the details of the logged User.
[**getUser**](UserApi.md#getuser) | Get a User by id.
[**matchUsers**](UserApi.md#matchusers) | Load user ids from the database by filtering them using the provided Filter.


# **checkTokenValidity**
> bool checkTokenValidity(userId, token)

Check token validity for a user.

Checks that the provided token is (still) valid for the provided user id (or user login).

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api_instance = UserApi();
final userId = userId_example; // String | The UUID that identifies the user uniquely
final token = token_example; // String | The token that will be checked

try {
    final result = api_instance.checkTokenValidity(userId, token);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->checkTokenValidity: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The UUID that identifies the user uniquely | 
 **token** | **String**| The token that will be checked | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrModifyUser**
> User createOrModifyUser(user)

Create a new user or modify an existing one.

A user must have a login, an email or a mobilePhone defined, a user should be linked to either a Healthcare Professional, a Patient or a Device. When modifying an user, you must ensure that the rev obtained when getting or creating the user is present as the rev is used to guarantee that the user has not been modified by a third party.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api_instance = UserApi();
final user = User(); // User | The user that must be created in the database.

try {
    final result = api_instance.createOrModifyUser(user);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->createOrModifyUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user** | [**User**](User.md)| The user that must be created in the database. | 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createToken**
> String createToken(userId)

Create a token for a user.

A token is used to authenticate the user. It is just like a password but it is destined to be used by programs instead of humans. Tokens have a limited validity period (one month).

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api_instance = UserApi();
final userId = userId_example; // String | The UUID that identifies the user uniquely

try {
    final result = api_instance.createToken(userId);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->createToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The UUID that identifies the user uniquely | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUser**
> String deleteUser(userId)

Delete an existing user.

Deletes the user identified by the provided unique userId.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api_instance = UserApi();
final userId = userId_example; // String | The UUID that uniquely identifies the user to be deleted.

try {
    final result = api_instance.deleteUser(userId);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->deleteUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The UUID that uniquely identifies the user to be deleted. | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **filterUsers**
> PaginatedListUser filterUsers(filter, nextUserId, limit)

Load users from the database by filtering them using the provided Filter.

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Users are AllUsersFilter and UsersByIdsFilter. This method returns a paginated list of users (with a cursor that lets you query the following items).

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api_instance = UserApi();
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
final nextUserId = nextUserId_example; // String | The id of the first User in the next page
final limit = 56; // int | The number of users to return in the queried page

try {
    final result = api_instance.filterUsers(filter, nextUserId, limit);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->filterUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](Filter.md)| The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill | 
 **nextUserId** | **String**| The id of the first User in the next page | [optional] 
 **limit** | **int**| The number of users to return in the queried page | [optional] 

### Return type

[**PaginatedListUser**](PaginatedListUser.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLoggedUser**
> User getLoggedUser()

Get the details of the logged User.

When you make a call to the server, an authentication token is used to identify you. This call returns the complete User object that corresponds to your authentication credentials.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api_instance = UserApi();

try {
    final result = api_instance.getLoggedUser();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->getLoggedUser: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUser**
> User getUser(userId)

Get a User by id.

Each user is uniquely identified by a user id. The user id is a UUID. This userId is the preferred method to retrieve one specific user.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api_instance = UserApi();
final userId = userId_example; // String | The UUID that identifies the user uniquely

try {
    final result = api_instance.getUser(userId);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->getUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The UUID that identifies the user uniquely | 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchUsers**
> List<String> matchUsers(filter)

Load user ids from the database by filtering them using the provided Filter.

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Users are AllUsersFilter and UsersByIdsFilter. This method returns the list of the ids of the users matching the filter.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api_instance = UserApi();
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill

try {
    final result = api_instance.matchUsers(filter);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->matchUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](Filter.md)| The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill | 

### Return type

**List<String>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

