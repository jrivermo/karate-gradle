Feature: Escenario reutilizables User

  @CrearUsuario
  Scenario:
    * def user = read('classpath:../data/agregar.json')
    Given url urlBase
    And request user
    When method POST
    Then status 200

    @consultaUser
    Scenario:
      Given url urlBase+"/"+new_user
      When method GET
      Then status 200
      * print response
      * def nombreuser = response.username
