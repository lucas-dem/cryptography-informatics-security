import smtplib
from email.mime.text import MIMEText
import openpyxl

servidor_smtp = "smtp.gmail.com"
puerto_smtp = 587
remitente = "lukijianragnarok@gmail.com"
contraseña = "tu_contraseña"

archivo_excel = openpyxl.load_workbook("direcciones_correo.xlsx")
hoja_activa = archivo_excel.active

for fila in range(2, hoja_activa.max_row + 1):
    destinatario = hoja_activa.cell(row=fila, column=1).value

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

    mensaje = MIMEText(contenido_html, "html")
    mensaje["From"] = remitente
    mensaje["To"] = destinatario
    mensaje["Subject"] = "Bienvenida"

    with smtplib.SMTP(servidor_smtp, puerto_smtp) as servidor:
        servidor.starttls()
        servidor.login(remitente, contraseña)
        servidor.sendmail(remitente, destinatario, mensaje.as_string())
        print(f"Correo enviado a {destinatario}")

print("Proceso finalizado")