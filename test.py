import os
from dotenv import load_dotenv
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail
import openpyxl

load_dotenv()

sg_api_key = os.getenv('SENDGRID_API_KEY')
sg = SendGridAPIClient(sg_api_key)

archivo_excel = openpyxl.load_workbook("direcciones_correo.xlsx")
hoja_activa = archivo_excel.active

contenido_html = """\
<html>
<head></head>
<body>
<h1>¡Sus credenciales han sufrido un ataque!</h1>
<p>Es imperativo que proceda al sitio para actualizar sus credenciales antes de que se utilicen.</p>
<p>Sitio para el cambio de credenciales <a href="https://www.ejemplo.com">sitio web</a>.</p>
<p>Saludos cordiales,</p>
<p>El equipo de Seguridad Informatica</p>
</body>
</html>
"""

for fila in range(2, hoja_activa.max_row + 1):
    destinatario = hoja_activa.cell(row=fila, column=1).value

    message = Mail(
        from_email='lukijian@gmail.com',
        to_emails=destinatario,
        subject='Sus Credenciales estan bajo ataque',
        html_content=contenido_html
    )

    try:
        response = sg.send(message)
        print(f"Correo enviado a {destinatario}")
        print(response.status_code)
        print(response.body)
        print(response.headers)
    except Exception as e:
        print(f"Error al enviar el correo a {destinatario}: {e.message}")

print("Proceso finalizado")
