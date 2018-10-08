BEGIN
   DBMS_SCHEDULER.create_job
   (
      job_name          => 'GENERA_VENTAS'
    , job_type          => 'PLSQL_BLOCK'
    , job_action        =>
        'BEGIN
            supermercado.genera_ventas;
         END;'
    , start_date        => SYSTIMESTAMP + 1/24/60      -- En un minuto
    , end_date          => SYSTIMESTAMP + 3/48         -- En hora y media
    , repeat_interval   => 'FREQ=MINUTELY; INTERVAL=2' --- Cada dos minutos
    , enabled           => TRUE
    , comments          => 'Generador de ventas'
   );
   COMMIT;
END;
/
--@E:\JT-Documentos\Maestria\BigData\Supermercado\demonio_genera_ventas.sql