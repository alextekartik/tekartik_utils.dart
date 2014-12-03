library tekartik_uri_utils;

/**
 * Typically the argument is window.location.search
 */
Map<String, String> uriGetArguments(String search) {
  Map<String, String> params = new Map();
  if (search != null) {
    int questionMarkIndex = search.indexOf('?');
    if (questionMarkIndex != -1) {
      search = search.substring(questionMarkIndex + 1);
    }
    return Uri.splitQueryString(search);
//    search.split("&").forEach((e) {
//      if (e.contains("=")) {
//        List<String> split = e.split("=");
//        params[split[0]] = split[1];
//      } else {
//        if (!e.isEmpty) {
//          params[e] = '';
//        }
//      }
//    });
  }
  return params;
}

// Use urlAddParam instead
String urlAddParam(String url, String param, dynamic value) {
  if (url.indexOf('?') == -1) {
    return "$url?$param=$value";
  } else {
    return "$url&$param=$value";
  }
}

String uriPath(String path) {
  Uri uri = Uri.parse(path);
  return uri.path;
}

String urlPath(String path) {
  Uri uri = Uri.parse(path);
  return uri.path;
}

// remove / prefix
String urlNonAbsolutePath(String path) {
  if (path.startsWith("/")) {
    return path.substring(1);
  }
  return path;
}

String urlChangeQueryParameters(String url, Map<String, String> newQueryParams) {
  Uri uri = Uri.parse(url);
  return uriChangeQueryParameters(uri, newQueryParams).toString();
}


Uri uriChangeQueryParameters(Uri uri, Map<String, String> newQueryParams) {
  return new Uri(scheme: uri.scheme, userInfo: uri.userInfo, host: uri.host, port: uri.port, path: uri.path //
  , queryParameters: newQueryParams //
  , fragment: null);
}

Uri uriNoParamNoFragment(Uri uri) {
  return new Uri(scheme: uri.scheme, userInfo: uri.userInfo, //
  host: uri.host, port: uri.port, //
  path: uri.path);

}

String urlNoParamNoFragment(String url) {
  return uriNoParamNoFragment(Uri.parse(url)).toString();
}
String urlRoot(String url) {
  return uriRoot(Uri.parse(url)).toString();
}

Uri uriRoot(Uri uri) {
  return new Uri(scheme: uri.scheme, userInfo: uri.userInfo, //
  host: uri.host, port: uri.port);

}

String urlHashFix(String hash) {
  if (hash != null && hash.startsWith('#')) {
    hash = hash.substring(1);
  }
  return hash;
}

/**
 * find the part hash or a url (without the #)
 */
String urlHash(String url) {
  int sharp = url.indexOf('#');
  if (sharp != -1) {
    return url.substring(sharp + 1);
  }
  return null;
}
