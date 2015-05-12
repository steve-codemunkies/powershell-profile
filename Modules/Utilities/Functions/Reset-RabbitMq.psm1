Function Reset-RabbitMq {
  $path = "C:\Program Files (x86)\RabbitMQ Server\rabbitmq_server-3.4.0\sbin\rabbitmqctl.bat"
  $arguments = @("stop_app", "reset", "start_app")

  for ($i = 0; $i -lt $arguments.length; $i++) {
    Start-Process $path $arguments[$i] -NoNewWindow -Wait
  }
}
