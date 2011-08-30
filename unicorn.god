# Start with "god -c unicorn.god"

  God.watch do |w|
    w.name = "unicorn"
    w.dir = "/home/dotcloud/current"
    w.interval = 30.seconds # default
    w.start = "unicorn"
    w.log = "/home/dotcloud/log/unicorn.log"

    w.start_if do |start|
      start.condition(:process_running) do |c|
        c.interval = 5.seconds
        c.running = false
      end
    end

end
