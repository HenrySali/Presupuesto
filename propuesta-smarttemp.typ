// ============================================================
// SmartTemp - Propuesta Comercial
// Variables parametrizadas para personalizar por cliente
// ============================================================

#let client_name = "Cliente"
#let date = {
  let today = datetime.today()
  str(today.day()) + "/" + str(today.month()) + "/" + str(today.year())
}
#let quantity_sensors = 2
// Nota: la interfaz SmartTemp soporta hasta 4 sensores por bus.
// El ejemplo muestra 1 interfaz con 2 sensores conectados.
#let quantity_interfaces = 1
#let price_kit = 886000
#let price_interface = 797000
#let price_sensor = 266000
#let price_server_monthly = 89000
#let abono_menos_3 = 89000
#let abono_4_15 = 71000
#let abono_16_plus = 53000
#let deposito_garantia = 354000
#let price_install_b = 177000
#let price_recalibracion = 89000
#let contact_email = "smarttemp@diseñosyefectos.com"
#let contact_phone = "1125111398"
#let contact_web = "diseñosyefectos.com"
#let contact_web_url = "https://xn--diseosyefectos-tnb.com/"

// Auto-calculated totals
#let total_plan_a = price_kit + (price_interface * quantity_interfaces) + (price_sensor * quantity_sensors)
#let total_plan_b_setup = price_install_b
#let total_plan_b_monthly = 5 * abono_4_15

// Number formatting: Argentine format with dots as thousands separator
#let fmt(n) = {
  let s = str(n)
  let len = s.len()
  let result = ""
  let count = 0
  let i = len - 1
  while i >= 0 {
    if count > 0 and calc.rem(count, 3) == 0 {
      result = "." + result
    }
    result = s.at(i) + result
    count = count + 1
    i = i - 1
  }
  result
}

// ============================================================
// Colores y estilos
// ============================================================
#let brand-blue = rgb("#29b6f6")
#let brand-blue-dark = rgb("#0288d1")
#let brand-green = rgb("#00b894")
#let brand-orange = rgb("#fdcb6e")
#let brand-red = rgb("#e17055")
#let brand-purple = rgb("#a29bfe")
#let dark-text = rgb("#2d3436")
#let gray-text = rgb("#636e72")
#let light-gray = rgb("#f8f9fa")
#let border-gray = rgb("#dfe6e9")
#let light-text = rgb("#b2bec3")
#let table-alt = rgb("#f5f6fa")

// ============================================================
// Thermometer Logo (PNG for reliable cross-platform rendering)
// ============================================================
#let thermo-logo(size: 36pt) = {
  image("icon-128.png", width: size, height: size)
}

#let thermo-logo-large(size: 80pt) = {
  image("icon-512.png", width: size, height: size)
}

// ============================================================
// Configuración de página
// ============================================================
#set page(
  paper: "a4",
  margin: (top: 32mm, bottom: 20mm, left: 18mm, right: 18mm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num > 1 {
      v(4pt)
      block(width: 100%, stroke: (bottom: 3pt + brand-blue), inset: (bottom: 8pt))[
        #grid(columns: (auto, 1fr, auto), column-gutter: 10pt, align: (horizon, horizon, horizon))[
          #thermo-logo(size: 32pt)
        ][
          #text(size: 18pt, weight: "bold", fill: brand-blue, style: "italic")[SmartTemp]\
          #text(size: 7.5pt, fill: gray-text, tracking: 1pt)[MONITOREO INTELIGENTE DE TEMPERATURA]
        ][
          #align(right)[
            #text(size: 7.5pt, fill: gray-text)[Buenos Aires, #date]
          ]
        ]
      ]
      v(4pt)
    }
  },
  footer: context {
    let page-num = counter(page).get().first()
    block(width: 100%, stroke: (top: 0.5pt + border-gray), inset: (top: 6pt))[
      #set text(size: 8pt, fill: light-text)
      #grid(columns: (1fr, auto))[
        SmartTemp - Monitoreo Inteligente de Temperatura
      ][
        Página #str(page-num)
      ]
    ]
  }
)

#set text(font: ("Segoe UI", "Noto Sans"), size: 10pt, fill: dark-text)
#set par(leading: 0.6em, spacing: 0.8em)

// ============================================================
// Funciones auxiliares
// ============================================================
#let section-title(title) = {
  block(width: 100%, below: 12pt, stroke: (bottom: 2pt + border-gray), inset: (bottom: 6pt))[
    #text(size: 18pt, weight: "bold", fill: brand-blue)[#title]
  ]
}

#let feature-card(icon, title, desc, border-color: brand-blue) = {
  box(width: 100%, radius: 10pt, fill: light-gray, stroke: (left: 4pt + border-color), inset: 12pt)[
    #text(size: 18pt)[#icon]
    #h(6pt)
    #text(size: 10.5pt, weight: "bold", fill: dark-text)[#title]\
    #v(3pt)
    #text(size: 9pt, fill: gray-text)[#desc]
  ]
}

#let check-item(content_text) = {
  grid(columns: (18pt, 1fr), column-gutter: 4pt,
    text(fill: brand-green, weight: "bold", size: 12pt)[#sym.checkmark],
    text(size: 9.5pt, fill: dark-text)[#content_text]
  )
}

// ============================================================
// PAGINA 1: PORTADA
// ============================================================
#page(margin: (top: 16mm, bottom: 20mm, left: 18mm, right: 18mm), header: none)[
  #align(center + horizon)[
    #thermo-logo-large(size: 90pt)
    #v(16pt)
    #text(size: 40pt, weight: "bold", fill: brand-blue, style: "italic")[SmartTemp]
    #v(6pt)
    #block(stroke: (top: 0.5pt + rgb("#b0bec5"), bottom: 0.5pt + rgb("#b0bec5")), inset: (top: 6pt, bottom: 6pt, left: 20pt, right: 20pt))[
      #text(size: 11pt, weight: "medium", fill: rgb("#90a4ae"), tracking: 3pt)[CALIBRATION SYSTEMS]
    ]
    #v(8pt)
    #text(size: 16pt, weight: "light", fill: rgb("#546e7a"))[Sistema de Monitoreo de Temperatura]
    #v(24pt)
    #block(width: 420pt)[
      #text(size: 14pt, fill: dark-text, weight: "light")[Monitoreo continuo con trazabilidad, alertas en tiempo real, asistente IA integrado y plataforma cloud propia.]
    ]
    #v(36pt)
    #grid(columns: 5, column-gutter: 12pt,
      box(radius: 10pt, fill: light-gray, stroke: 0.5pt + border-gray, inset: (x: 12pt, y: 8pt))[
        #text(size: 9pt, weight: "medium")[#str.from-unicode(0x2601) Cloud Propio]
      ],
      box(radius: 10pt, fill: light-gray, stroke: 0.5pt + border-gray, inset: (x: 12pt, y: 8pt))[
        #text(size: 9pt, weight: "medium")[#str.from-unicode(0x1F4F1) Alertas WhatsApp]
      ],
      box(radius: 10pt, fill: light-gray, stroke: 0.5pt + border-gray, inset: (x: 12pt, y: 8pt))[
        #text(size: 9pt, weight: "medium")[#str.from-unicode(0x1F916) Asistente IA]
      ],
      box(radius: 10pt, fill: light-gray, stroke: 0.5pt + border-gray, inset: (x: 12pt, y: 8pt))[
        #text(size: 9pt, weight: "medium")[#str.from-unicode(0x1F52C) Calibración Trazable]
      ],
      box(radius: 10pt, fill: light-gray, stroke: 0.5pt + border-gray, inset: (x: 12pt, y: 8pt))[
        #text(size: 9pt, weight: "medium")[#str.from-unicode(0x1F4CA) Dashboard Web]
      ],
    )
  ]
]


// ============================================================
// PAGINA 2: EL SISTEMA + ESQUEMA DE FUNCIONAMIENTO
// ============================================================

#section-title("El Sistema SmartTemp")

#text(size: 10pt, fill: gray-text)[SmartTemp es un sistema IoT que mide, procesa y registra temperatura de forma continua. Toda la información está disponible en tiempo real desde cualquier dispositivo con acceso a internet.]

#v(10pt)

#grid(columns: (1fr, 1fr), column-gutter: 12pt, row-gutter: 12pt,
  feature-card(
    str.from-unicode(0x1F4E1),
    "Monitoreo Continuo 24/7",
    "Registro automático con intervalos configurables desde 1 minuto. Sin descarga manual por USB.",
    border-color: brand-blue
  ),
  feature-card(
    str.from-unicode(0x1F310),
    "Dashboard Web",
    "Gráficos interactivos, históricos, estado en tiempo real. Accesible desde cualquier navegador.",
    border-color: brand-green
  ),
  feature-card(
    str.from-unicode(0x1F6A8),
    "Alertas WhatsApp + Email",
    "Notificaciones inmediatas cuando la temperatura excede umbrales. Directamente en su celular.",
    border-color: brand-orange
  ),
  feature-card(
    str.from-unicode(0x1F52C),
    "Calibración Trazable",
    "Con patrón de referencia certificado LogTag UTRID-16. Generación automática de certificados.",
    border-color: brand-red
  ),
  feature-card(
    str.from-unicode(0x1F916),
    "TERMO - Asistente IA Integrado",
    "Chatbot inteligente que responde consultas en tiempo real: temperaturas, estado de sensores, instrucciones de uso y diagnósticos. Disponible 24/7 dentro del dashboard.",
    border-color: brand-purple
  ),
  feature-card(
    str.from-unicode(0x1F4C8),
    "Históricos Ilimitados",
    "Base de datos sin tope. +112.000 mediciones en producción. Exportación a PDF/Excel.",
    border-color: brand-green
  ),
)

#v(10pt)

#block(width: 100%, radius: 10pt, fill: brand-blue, inset: 14pt)[
  #text(fill: white, size: 11pt, weight: "bold")[#str.from-unicode(0x1F916) TERMO - Asistente Virtual Inteligente]
  #v(5pt)
  #text(fill: white.transparentize(10%), size: 9pt)[Pregunte en lenguaje natural: "¿Cuál es la temperatura del freezer?" - "¿Qué sensores están offline?" - "¿Cómo configuro un umbral?" - "¿Por qué se desconectó?"]
]

#v(10pt)

#section-title("Esquema de Funcionamiento")

#block(width: 100%, radius: 12pt, fill: light-gray, inset: 14pt)[
  #align(center)[
    #grid(columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr), align: (center + horizon),
      stack(dir: ttb, spacing: 5pt,
        circle(radius: 22pt, fill: border-gray)[#align(center + horizon)[#text(size: 16pt)[#str.from-unicode(0x1F321)]]],
        text(size: 8pt, weight: "bold")[Sensores],
        text(size: 7pt, fill: gray-text)[DS18B20 / PT100],
      ),
      text(size: 14pt, fill: brand-blue, weight: "bold")[#sym.arrow.r],
      stack(dir: ttb, spacing: 5pt,
        circle(radius: 22pt, fill: rgb("#81ecec"))[#align(center + horizon)[#text(size: 16pt)[#str.from-unicode(0x1F4F6)]]],
        text(size: 8pt, weight: "bold")[Interfaz WiFi],
        text(size: 7pt, fill: gray-text)[ESP8266],
      ),
      text(size: 14pt, fill: brand-blue, weight: "bold")[#sym.arrow.r],
      stack(dir: ttb, spacing: 5pt,
        circle(radius: 22pt, fill: rgb("#74b9ff"))[#align(center + horizon)[#text(size: 16pt)[#str.from-unicode(0x2601)]]],
        text(size: 8pt, weight: "bold")[Cloud],
        text(size: 7pt, fill: gray-text)[BD + API],
      ),
      text(size: 14pt, fill: brand-blue, weight: "bold")[#sym.arrow.r],
      stack(dir: ttb, spacing: 5pt,
        circle(radius: 22pt, fill: rgb("#ffeaa7"))[#align(center + horizon)[#text(size: 16pt)[#str.from-unicode(0x1F4F1)]]],
        text(size: 8pt, weight: "bold")[Alertas],
        text(size: 7pt, fill: gray-text)[WhatsApp + Email],
      ),
      text(size: 14pt, fill: brand-blue, weight: "bold")[#sym.arrow.r],
      stack(dir: ttb, spacing: 5pt,
        circle(radius: 22pt, fill: brand-purple)[#align(center + horizon)[#text(size: 16pt)[#str.from-unicode(0x1F464)]]],
        text(size: 8pt, weight: "bold")[Usuario],
        text(size: 7pt, fill: gray-text)[Web / Móvil],
      ),
    )
  ]
]


// ============================================================
// PAGINA 3: DATOS TECNICOS + APLICACIONES
// ============================================================
#pagebreak()

#section-title("Datos Técnicos")

#table(
  columns: (2fr, 3fr),
  stroke: 0.5pt + border-gray,
  inset: (x: 10pt, y: 7pt),
  fill: (x, y) => {
    if y == 0 { brand-blue }
    else if calc.rem(y, 2) == 0 { table-alt }
    else { white }
  },
  table.header(
    text(fill: white, weight: "bold", size: 9.5pt)[Parámetro],
    text(fill: white, weight: "bold", size: 9.5pt)[Especificación],
  ),
  [*Sensores*], [DS18B20 (digital), PT100 (RTD), NTC],
  [*Rango de temperatura*], [#str.from-unicode(0x2212)55°C a +125°C (DS18B20) / #str.from-unicode(0x2212)200°C a +850°C (PT100)],
  [*Precisión*], [#str.from-unicode(0x00B1)0.5°C (DS18B20) / #str.from-unicode(0x00B1)0.1°C (PT100 calibrado)],
  [*Resolución*], [0.0625°C (12 bits)],
  [*Intervalo de registro*], [Configurable: 1 minuto a 24 horas],
  [*Interfaz de comunicación*], [WiFi 802.11 b/g/n + MQTT],
  [*Alimentación*], [Fuente 5V USB o Batería Li-Ion (deep sleep >6 meses)],
  [*Alcance WiFi*], [50m interior / 100m exterior],
  [*Almacenamiento*], [Cloud ilimitado (MariaDB)],
  [*Patrón de calibración*], [LogTag UTRID-16 (#str.from-unicode(0x00B1)0.5°C, 21 CFR Part 11)],
  [*Asistente IA*], [TERMO - Asistente virtual integrado en dashboard],
  [*Usuarios*], [Plan A: 4 incluidos | Plan B: Ilimitados],
)

#v(10pt)

#section-title("Aplicaciones")

#grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt, row-gutter: 12pt,
  box(width: 100%, radius: 10pt, fill: light-gray, inset: 12pt)[
    #align(center)[
      #text(size: 22pt)[#str.from-unicode(0x1F3E5)]\
      #text(size: 9.5pt, weight: "bold")[Salud]\
      #text(size: 8pt, fill: gray-text)[Laboratorios, consultorios, hemoterapia, farmacia hospitalaria]
    ]
  ],
  box(width: 100%, radius: 10pt, fill: light-gray, inset: 12pt)[
    #align(center)[
      #text(size: 22pt)[#str.from-unicode(0x2744)]\
      #text(size: 9.5pt, weight: "bold")[Cadena de Frío]\
      #text(size: 8pt, fill: gray-text)[Heladeras, freezers, cámaras, crioconservación]
    ]
  ],
  box(width: 100%, radius: 10pt, fill: light-gray, inset: 12pt)[
    #align(center)[
      #text(size: 22pt)[#str.from-unicode(0x1F48A)]\
      #text(size: 9.5pt, weight: "bold")[Farmacéutica]\
      #text(size: 8pt, fill: gray-text)[Medicamentos y vacunas bajo condiciones controladas]
    ]
  ],
  box(width: 100%, radius: 10pt, fill: light-gray, inset: 12pt)[
    #align(center)[
      #text(size: 22pt)[#str.from-unicode(0x1F356)]\
      #text(size: 9.5pt, weight: "bold")[Alimentos]\
      #text(size: 8pt, fill: gray-text)[Restaurantes, caterings, transporte refrigerado]
    ]
  ],
  box(width: 100%, radius: 10pt, fill: light-gray, inset: 12pt)[
    #align(center)[
      #text(size: 22pt)[#str.from-unicode(0x1F52C)]\
      #text(size: 9.5pt, weight: "bold")[Laboratorios]\
      #text(size: 8pt, fill: gray-text)[Control ambiental, incubadoras, biología molecular]
    ]
  ],
  box(width: 100%, radius: 10pt, fill: light-gray, inset: 12pt)[
    #align(center)[
      #text(size: 22pt)[#str.from-unicode(0x1F3ED)]\
      #text(size: 9.5pt, weight: "bold")[Industria]\
      #text(size: 8pt, fill: gray-text)[Data centers, salas limpias, procesos productivos]
    ]
  ],
)

#v(12pt)

#section-title("Funcionalidades Incluidas")

#grid(columns: (1fr, 1fr), column-gutter: 10pt, row-gutter: 4pt,
  check-item([Monitoreo continuo 24/7]),
  check-item([Dashboard web interactivo]),
  check-item([Alertas WhatsApp + Email]),
  check-item([Asistente IA (TERMO)]),
  check-item([Calibración trazable]),
  check-item([Certificados automáticos]),
  check-item([Históricos ilimitados]),
  check-item([Exportación PDF/Excel]),
  check-item([Acceso móvil]),
  check-item([Múltiples usuarios]),
  check-item([Soporte técnico]),
  check-item([Instalación incluida]),
)


// ============================================================
// PAGINA 4: PLANES COMERCIALES
// ============================================================
#pagebreak()

#section-title("Planes Comerciales")

#text(size: 9.5pt, fill: gray-text)[Dos modalidades de contratación según sus necesidades. Ambas incluyen todas las funcionalidades del sistema, TERMO, alertas y usuarios ilimitados.]

#v(14pt)

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  // Plan A
  box(width: 100%, radius: 14pt, stroke: 2pt + brand-blue, inset: 18pt)[
    #text(size: 14pt, weight: "bold", fill: brand-blue)[Plan A - Pago Único]\
    #v(4pt)
    #text(size: 9pt, fill: gray-text)[Ideal para 1-4 puntos de monitoreo]\
    #v(12pt)
    #set text(size: 9pt)
    #grid(columns: (14pt, 1fr), column-gutter: 4pt, row-gutter: 6pt,
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Kit plataforma: *\$#fmt(price_kit)*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Interfaz WiFi: *\$#fmt(price_interface) c/u*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Sensor + calibración: *\$#fmt(price_sensor) c/u*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Acceso móvil: *Incluido en el kit*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Instalación: *Incluida*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Usuarios: *4* (adic. \$20.000/mes)],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Garantía: *6 meses*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Servidor + BD: *\$#fmt(price_server_monthly)/mes*],
    )
  ],
  // Plan B
  box(width: 100%, radius: 14pt, stroke: 2pt + border-gray, inset: 18pt)[
    #text(size: 14pt, weight: "bold", fill: brand-blue)[Plan B - Abono Mensual]\
    #v(4pt)
    #text(size: 9pt, fill: gray-text)[Mínimo 5 sensores - Menor inversión inicial]\
    #v(12pt)
    #set text(size: 9pt)
    #grid(columns: (14pt, 1fr), column-gutter: 4pt, row-gutter: 6pt,
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Instalación: *\$#fmt(price_install_b)*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Menos de 3 sensores: *\$#fmt(abono_menos_3)/mes c/u*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [De 4 a 15 sensores: *\$#fmt(abono_4_15)/mes c/u*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [De 16 en adelante: *\$#fmt(abono_16_plus)/mes c/u*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Garantía por falla técnica: *100% al sistema*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Asistencia técnica telefónica: *24/7*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Interfaces en comodato durante vigencia del contrato],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Incluye: Cloud, alertas, soporte, TERMO, móvil],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Usuarios: *Ilimitados*],
      text(fill: brand-green, weight: "bold")[#sym.checkmark], [Depósito en garantía por equipos: *\$#fmt(deposito_garantia)* (reembolsable)],
    )
  ],
)

#v(10pt)

#text(size: 10pt, weight: "bold", fill: brand-blue)[Ejemplo: Plan A - #str(quantity_sensors) sensores]
#v(4pt)

#table(
  columns: (auto, auto, 1fr, auto, auto),
  stroke: 0.5pt + border-gray,
  inset: (x: 8pt, y: 6pt),
  fill: (x, y) => {
    if y == 0 { dark-text }
    else if calc.rem(y, 2) == 0 { table-alt }
    else { white }
  },
  table.header(
    text(fill: white, weight: "bold", size: 8.5pt)[Código],
    text(fill: white, weight: "bold", size: 8.5pt)[Cant],
    text(fill: white, weight: "bold", size: 8.5pt)[Descripción],
    text(fill: white, weight: "bold", size: 8.5pt)[\$ Unit.],
    text(fill: white, weight: "bold", size: 8.5pt)[\$ Total],
  ),
  text(size: 8.5pt, weight: "bold")[ST-KIT], text(size: 8.5pt)[1], text(size: 8.5pt)[Kit plataforma SmartTemp (Cloud + Dashboard + TERMO + Alertas + Acceso Móvil + Puesta en marcha)], align(right, text(size: 8.5pt)[#fmt(price_kit)]), align(right, text(size: 8.5pt)[#fmt(price_kit)]),
  text(size: 8.5pt, weight: "bold")[ST-INT], text(size: 8.5pt)[#str(quantity_interfaces)], text(size: 8.5pt)[Interfaz SmartTemp WiFi (ESP8266 + gabinete + fuente + firmware)], align(right, text(size: 8.5pt)[#fmt(price_interface)]), align(right, text(size: 8.5pt)[#fmt(price_interface * quantity_interfaces)]),
  text(size: 8.5pt, weight: "bold")[ST-SENS], text(size: 8.5pt)[#str(quantity_sensors)], text(size: 8.5pt)[Sensor DS18B20 (#str.from-unicode(0x2212)55 a +125°C) + cable + calibración trazable + certificado], align(right, text(size: 8.5pt)[#fmt(price_sensor)]), align(right, text(size: 8.5pt)[#fmt(price_sensor * quantity_sensors)]),
)

#block(width: 100%, fill: brand-blue, radius: (bottom-left: 4pt, bottom-right: 4pt), inset: (x: 8pt, y: 7pt))[
  #grid(columns: (1fr, auto))[
    #text(fill: white, weight: "bold", size: 10pt)[TOTAL INVERSIÓN INICIAL]
  ][
    #text(fill: white, weight: "bold", size: 10pt)[\$ #fmt(total_plan_a)]
  ]
]

#text(size: 8pt, fill: gray-text)[Servidor + Base de datos: \$#fmt(price_server_monthly)/mes (hosting cloud dedicado). Garantía: 6 meses.]

#pagebreak()

#text(size: 10pt, weight: "bold", fill: brand-blue)[Ejemplo: Plan B - 5 sensores (abono)]
#v(4pt)

#table(
  columns: (auto, 1fr, auto),
  stroke: 0.5pt + border-gray,
  inset: (x: 8pt, y: 6pt),
  fill: (x, y) => {
    if y == 0 { dark-text }
    else if calc.rem(y, 2) == 0 { table-alt }
    else { white }
  },
  table.header(
    text(fill: white, weight: "bold", size: 8.5pt)[Concepto],
    text(fill: white, weight: "bold", size: 8.5pt)[Descripción],
    text(fill: white, weight: "bold", size: 8.5pt)[Precio],
  ),
  text(size: 8.5pt, weight: "bold")[Instalación], text(size: 8.5pt)[Instalación + configuración + puesta en marcha], align(right, text(size: 8.5pt)[\$#fmt(price_install_b)]),
  text(size: 8.5pt, weight: "bold")[Abono mensual], text(size: 8.5pt)[Menos de 3: \$#fmt(abono_menos_3)/mes c/u | 4-15: \$#fmt(abono_4_15)/mes c/u | 16+: \$#fmt(abono_16_plus)/mes c/u], align(right, text(size: 8.5pt)[Escalonado]),
  text(size: 8.5pt, weight: "bold")[Garantía], text(size: 8.5pt)[Garantía por falla técnica 100% al sistema], align(right, text(size: 8.5pt)[Incluida]),
  text(size: 8.5pt, weight: "bold")[Asistencia], text(size: 8.5pt)[Asistencia técnica telefónica 24/7], align(right, text(size: 8.5pt)[Incluida]),
)

#block(width: 100%, fill: border-gray, inset: (x: 8pt, y: 6pt))[
  #grid(columns: (1fr, auto))[
    #text(weight: "bold", size: 8.5pt)[INVERSIÓN INICIAL (única vez)]
  ][
    #text(weight: "bold", size: 8.5pt)[\$#fmt(price_install_b)]
  ]
]
#block(width: 100%, fill: brand-blue, radius: (bottom-left: 4pt, bottom-right: 4pt), inset: (x: 8pt, y: 7pt))[
  #grid(columns: (1fr, auto))[
    #text(fill: white, weight: "bold", size: 10pt)[RECURRENCIA MENSUAL (5 sensores)]
  ][
    #text(fill: white, weight: "bold", size: 10pt)[\$#fmt(total_plan_b_monthly)/mes]
  ]
]

#text(size: 8pt, fill: gray-text)[Costo total año 1: \$#fmt(price_install_b) + (\$#fmt(total_plan_b_monthly) x 12) = \$#fmt(price_install_b + total_plan_b_monthly * 12)]


// ============================================================
// PAGINA 5: POR QUE SMARTTEMP + CONDICIONES + CONTACTO
// ============================================================
#pagebreak()

#section-title("¿Por qué SmartTemp?")

#v(2pt)

#grid(columns: (1fr, 1fr), column-gutter: 10pt, row-gutter: 8pt,
  feature-card(
    str.from-unicode(0x1F916),
    "Asistente IA Integrado",
    "TERMO responde consultas 24/7. Ningún competidor lo ofrece.",
    border-color: brand-blue
  ),
  feature-card(
    str.from-unicode(0x1F4B0),
    "Sin Licencias de Terceros",
    "Cloud propio. No paga suscripciones a plataformas externas.",
    border-color: brand-green
  ),
  feature-card(
    str.from-unicode(0x1F4F2),
    "Alertas por WhatsApp",
    "Directo a su celular. Sin apps extra.",
    border-color: brand-orange
  ),
  feature-card(
    str.from-unicode(0x1F6E0),
    "Instalación + Soporte + Escalable",
    "Todo configurado en sitio. Entrega en 7-15 días. Crezca sin límites.",
    border-color: brand-purple
  ),
)

#v(6pt)

#block(width: 100%, radius: 10pt, fill: brand-blue, inset: 12pt)[
  #text(fill: white, size: 10pt, weight: "bold")[Su inversión total es hasta un 65% menor que la competencia, con más funcionalidades incluidas y sin abonos ocultos de plataforma.]
]

#v(6pt)

#block(width: 100%, radius: 10pt, fill: light-gray, inset: 12pt)[
  #text(size: 9.5pt, weight: "bold", fill: dark-text)[Condiciones Generales]
  #v(4pt)
  #set text(size: 7.5pt, fill: gray-text)
  #grid(columns: (10pt, 1fr), column-gutter: 4pt, row-gutter: 3pt,
    text(fill: brand-blue)[#sym.bullet], [Precios en pesos argentinos al TC dólar BNA vendedor del día de facturación. No incluyen IVA. Validez: 15 días.],
    text(fill: brand-blue)[#sym.bullet], [Plazo de entrega: 7 a 15 días hábiles],
    text(fill: brand-blue)[#sym.bullet], [Forma de pago: 50% anticipo, 50% contra entrega],
  )
  #v(6pt)
  #text(size: 8.5pt, weight: "bold", fill: dark-text)[Condiciones Plan A:]
  #v(3pt)
  #grid(columns: (10pt, 1fr), column-gutter: 4pt, row-gutter: 3pt,
    text(fill: brand-blue)[#sym.bullet], [Garantía: *6 meses*],
    text(fill: brand-blue)[#sym.bullet], [Servidor + BD: *\$#fmt(price_server_monthly)/mes*],
    text(fill: brand-blue)[#sym.bullet], [Recalibración anual: *\$#fmt(price_recalibracion)/punto*],
  )
  #v(6pt)
  #text(size: 8.5pt, weight: "bold", fill: dark-text)[Condiciones Plan B:]
  #v(3pt)
  #grid(columns: (10pt, 1fr), column-gutter: 4pt, row-gutter: 3pt,
    text(fill: brand-blue)[#sym.bullet], [Instalación: *\$#fmt(price_install_b)*],
    text(fill: brand-blue)[#sym.bullet], [Abono mensual por sensor: *Menos de 3: \$#fmt(abono_menos_3) | 4-15: \$#fmt(abono_4_15) | 16+: \$#fmt(abono_16_plus)*],
    text(fill: brand-blue)[#sym.bullet], [Garantía por falla técnica: *100% al sistema*],
    text(fill: brand-blue)[#sym.bullet], [Asistencia técnica telefónica: *24/7*],
    text(fill: brand-blue)[#sym.bullet], [Interfaces en comodato durante vigencia del contrato],
    text(fill: brand-blue)[#sym.bullet], [Depósito en garantía por equipos en comodato: *\$#fmt(deposito_garantia)* (reembolsable al devolver equipos en buen estado)],
    text(fill: brand-blue)[#sym.bullet], [Abono mensual sujeto a ajuste al TC dólar BNA vendedor del día de facturación de cada mes],
  )
]

#v(6pt)

#align(center)[
  #block(width: 70%, radius: 12pt, fill: light-gray, inset: 12pt)[
    #align(center)[
      #text(size: 13pt, weight: "bold", fill: dark-text)[Contacto]
      #v(4pt)
      #text(size: 10pt, fill: gray-text)[#str.from-unicode(0x1F4E7) #contact_email]\
      #v(2pt)
      #text(size: 10pt, fill: gray-text)[#str.from-unicode(0x1F4F1) #contact_phone]\
      #v(2pt)
      #text(size: 10pt, fill: gray-text)[#str.from-unicode(0x1F310) #contact_web]
      #v(4pt)
      #text(size: 8pt, fill: light-text)[Solicite una demostración en vivo del sistema y del asistente TERMO]
    ]
  ]
]
