define [
  'angular'
  's/services'
  'angularResource'
],
(angular, services)->
  services.factory 'cookbook', ['$resource', ($resource)->
    ###
    GET /tasks/ : return the tasks list
    GET /tasks/:id : return the task identified by the given :id
    POST /tasks/ : create a new task corresponding to the JSON object given in the body request
    PUT /tasks/:id : update the task with values of the JSON object given in the body request
    DELETE /tasks/:id : delete the task with the given id
    ###

    $resource 'http://localhost:8080/recipes/:id', null,
      'get':
        'method': 'GET'
      'update':
        'method': 'PUT'
      'save':
        'method': 'POST'
      'query':
        'method': 'GET'
        'transformResponse': (data, headerGet)->
          return JSON.parse(data).recipes
        isArray: true
      'delete':
        'method': 'DELETE'
  ]