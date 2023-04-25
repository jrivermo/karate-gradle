Feature: Actualizar Usuarios

  @karate-test
  Scenario Outline: Actualiza User
    * call read('../utility/user_sni.feature@CrearUsuario'){new_user:<new_user>,status_ini:<status_ini>}
    * call read('../utility/user_sni.feature@consultaUser'){new_user:<new_user>}
    * def user = read('classpath:../data/actualizar.json')

    * print nombreuser

    Given url urlBase+"/"+new_user
    And request user
    When method PUT
    Then status 200
    * call read('../utility/user_sni.feature@consultaUser')

    Examples:
    | new_user | status_ini | new_status |
    | joeriver |      0     |     1      |
    | jrivermo |      0     |     1      |
    | eriveram |      0     |     1      |