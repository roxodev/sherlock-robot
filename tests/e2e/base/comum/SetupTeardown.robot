*Settings
Documentation    Setup e Teardown E2E

*Keywords
Iniciar sessão
    [Arguments]            ${url}
    # Definindo browser timeout
    Set Browser timeout    20

    # Intanciando sessão no chromium
    New Browser    chromium
    ...            headless=${headless}
    ...            slowMo=00:00:00.5

    # Abrindo página inicial
    New Page             ${url}
    Set Viewport Size    1280
    ...                  720

Capturar evidência
    # Definindo hashname para as evidências
    ${screenshot_name}    Screenshot Name

    # Capturando evidência
    Take Screenshot    fullPage=True                  
    ...                filename=${screenshot_name}