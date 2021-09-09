## TAS Help

TAS Help is subject to change without notice, but this is a sample
output of the current (as of 19 Nov 2004) TAS Help output, so you do not
need to keep scrolling up if you are trying to work in a window but want
to see the TAS Help output.

\* \<font color=\"blue\"\>+tas help\</font\> is the brief basic help.

\* \<font color=\"blue\"\>+tas help all\</font\> is the complete online
help for TAS.

    > +tas help

    Basic Help
    ----------

    +tas
          Lists the open tasks in the New queue
    +tas (task number)
          Claims task
    +tas (queue name) [(count)]
          Lists open tasks in specified queue name
    +tas reverse (queue name) [(count)]
          Lists open tasks in specified queue but in reverse order
    +tas (finish|done) '(message)
          Closes your claimed task with (message)
    +tas (que|queue|queues)
          Lists all public queues
    +tas transfer (queue)
          Moves your claimed task to specified queue
    +tas transfer (task number/s) (queue)
          Moves specified task number to specified queue
    +tas info (task number)
          Displays long information for specified task number
    +tas current
          Displays information on your claimed tasks
    +tas claimed
          Lists all claimed tasks
    +tas showall (queue name)
          Shows all information for all open tasks in specified queue
    +tas ugly (queue)
          Similar to 'queue' command but shows entire task message
    +tas open
          Lists all open tasks in all queues
    +tas online [(queue|all)]
          Lists players online with open tasks. Defaults 'New' queue if no queue name specified
    +tas recap
          Lists all tasks from the previous 24 hours
    +tas return
          Returns current claimed task to its queue
    +tas note '(note)
          Adds specified note to your current claimed assist
    +tas note (task number) '(note)
          Adds specified note to specified task number
    +tas shift (task number) (character)
          Shifts login alert status to character specified

    Also See: +tas help (help|basic|task|list|queue|login|misc|chat|personal|commands|subqueues|all)

\-\-\-\--

### +tas help all

    > +tas help all

    Help Help
    ---------

    +tas help help
          Lists this help
    +tas help basic
          Lists help on basic TAS commands
    +tas help task
          Lists help on task manipulation commands
    +tas help list
          Lists help on list manipulation commands
    +tas help queue
          Lists help on queue manipulation commands
    +tas help login
          Lists help on login commands
    +tas help misc
          Lists help on misc commands
    +tas help chat
          Lists help on chat commands
    +tas help personal
          Lists help on personal queues
    +tas help commands
          Lists all commands available to TAS
    +tas help subqueues
          Lists help for setting up and using subqueues
    +tas help all
          Lists all help for all help topics

    Basic Help
    ----------

    +tas
          Lists the open tasks in the New queue
    +tas (task number)
          Claims task
    +tas (queue name) [(count)]
          Lists open tasks in specified queue name
    +tas reverse (queue name) [(count)]
          Lists open tasks in specified queue but in reverse order
    +tas (finish|done) '(message)
          Closes your claimed task with (message)
    +tas (que|queue|queues)
          Lists all public queues
    +tas transfer (queue)
          Moves your claimed task to specified queue
    +tas transfer (task number/s) (queue)
          Moves specified task number to specified queue
    +tas info (task number)
          Displays long information for specified task number
    +tas current
          Displays information on your claimed tasks
    +tas claimed
          Lists all claimed tasks
    +tas showall (queue name)
          Shows all information for all open tasks in specified queue
    +tas ugly (queue)
          Similar to 'queue' command but shows entire task message
    +tas open
          Lists all open tasks in all queues
    +tas online [(queue|all)]
          Lists players online with open tasks. Defaults 'New' queue if no queue name specified
    +tas recap
          Lists all tasks from the previous 24 hours
    +tas return
          Returns current claimed task to its queue
    +tas note '(note)
          Adds specified note to your current claimed assist
    +tas note (task number) '(note)
          Adds specified note to specified task number
    +tas shift (task number) (character)
          Shifts login alert status to character specified

    Task Manipulation Help
    ----------------------

    +tas (task number)
          Claims task
    +tas (finish|done) '(message)
          Closes your claimed task with (message)
    +tas discard #[(...#)]
          Generic closure of tasks, can close multiple at one time
    +tas transfer (queue)
          Moves your claimed task to specified queue
    +tas transfer (task number/s) (queue)
          Moves specified task number to specified queue
    +tas retrieve (task number)
          Returns specified closed task number to the default queue
    +tas return
          Returns current claimed task to its queue
    +tas link (task number one) (task number two)
          Links specified task numbers to each other
    +tas flags
          Lists current defined flags
    +tas flag (task number) (flag)
          Flags specified task with specified flag
    +tas note '(note)
          Adds specified note to your current claimed assist
    +tas note (task number) '(note)
          Adds specified note to specified task number
    +tas attach (task number)
          Opens popup so you can attach multi-line note
    +tas priority (task number) (priority number)
          Sets specified tasks priority to specified priority
    +tas assign
          Lists any tasks that have been assigned to you
    +tas assign (task number) (player)
          Assigns specified task number to specified player
    +tas shift (task number) (character)
          Shifts login alert status to character specified

    List Manipulation Help
    ----------------------

    +tas (que|queue|queues)
          Lists all public queues
    +tas all
          Lists all queues, public and private
    +tas (queue name) [(count)]
          Lists open tasks in specified queue name
    +tas reverse (queue name) [(count)]
          Lists opent asks in specified queue, but in reverse order
    +tas unassigned (queue name) [(count)]
          Lists all unassigned tasks in specified queue name
    +tas me
          Lists open tasks for all queues that you are monitoring at login
    +tas current
          Displays information on your claimed tasks
    +tas claimed
          Lists all claimed tasks
    +tas open
          Lists all open tasks in all queues
    +tas online [(queue|all)]
          Lists players online with open tasks. Defaults 'New' queue if no queue name specified
    +tas showall (queue name)
          Shows all information for all open tasks in specified queue
    +tas showclosed (queue/character) [(count)]
          Shows all closed tasks for specified queue
    +tas shortclosed (queue/character) [(count)]
          Shows all closed tasks for specified queue or character in short format
    +tas ugly (queue)
          Similar to 'queue' command but shows entire task message
    +tas search (term)
          Searches all tasks for specified term
    +tas abort
          Aborts current search
    +tas list (player)
          Lists all open tasks for specified player
    +tas recap
          Lists all tasks from the previous 24 hours
    +tas info (task number)
          Displays long information for specified task number
    +tas prefer (queue name|none)
          Sets your preferred queue for listing with +tas. Set to none to remove.

    Queue Manipulation Help
    -----------------------

    +tas add (queue name)
          Adds a new queue with specified name
    +tas remove (queue name)
          Removes specified queue name
    +tas rename (queue name) (new queue name)
          Renames current queue name with new queue name
    +tas public (queue name)
          Sets specified queue as public
    +tas private (queue name)
          Sets specified queue as private
    +tas desc (queue name) '(queue description)
          Adds provided description to specified queue
    +tas associate (queue name)
          Associates you with specified queue for task command. Use NONE to remove
    +tas lock (queue name)
          Locks a queue so that only SHs may access and manipulate it
    +tas unlock (queue name)
          Unlocks a queue so that anyone may access and manipulate it

    Login Help
    -----------

    +tas login
          Lists queues you are monitoring at login
    +tas login (queue name)
          Adds or removes specified queue from your monitor list
    +tas watch
          Lists what tasks you are watching at login
    +tas watch (task number)
          Adds specified task number to your watch list
    +tas forget (task number)
          Removes specified task number from your watch list

    Misc Help
    ---------

    +tas page (task number) '(page message)
          Sends and offline page to the player that filed the task you supplied.
    +tas prefer (queue name|none)
          Sets your preferred queue for listing with +tas. Set to none to remove.
    +tas stats
          Displays TAS statistics
    +tas queuestats [(queue name)]
          Displays statistics all queues or specified queue
    +tas twiki (queue name)
          Popup with twiki formatted code for easy copy and paste into twiki
    +tas backup [(stop|start)]
          Stops, starts or forces a backup of the task databases.
    +tas initialize
          Initializes a new task database system. Destroys current databases. Disabled by default

    Chatline Help
    -------------

    +tas "on
          Start receiving and listening to the TAS chatline
    +tas "off
          Stop receiving and listening to the TAS chatline
    +tas "(text)
          Send specified message to the TAS chatline
    +tas ":(emote)
          Send specified emote to the TAS chatline
    +tas who
          Lists who is listening to the TAS chatline
    +tas recall
          Lists the last few chat messages and tasks from the TAS chatline
    +tas secure
          Sets preferred chatname from the body you are in for the TAS chatline
    +tas hide (queue name|misc)
          Hides TAS chatline output of specified type
    +tas hide
          Shows you what queues you are hiding.
    +tas show (queue name|misc)
          Shows TAS chatline output of specified type. All types are shown by default.

    Personal Task Queue
    -------------------

    Personal task queues are there for your ease of use in the TAS system.
    They can be setup so that any 'task' that you file goes directly into your
    queue. They are also a convenient place for other staff to transfer tasks
    that pertain to you or your area of interest.

    Personal task queues function in the same manner as other queues, only
    they are typically set as private queues and not displayed on the standard
    list of queues. To setup a personal task queue, follow these simple
    instructions:

    +tas add (queue name)
          Creates your queue
    +tas desc (queue) '(description of queue)
          Adds a description to your queue
    +tas private (queue name)
          Sets your task queue as a private queue
    +tas associate (queue name)
          Associates you with your queue

    To note, that while filing tasks into your personal queue via the 'task' command
    is silent, manipulation of those tasks is not. Closing, transfering, noting, etc.
    will be announced to everyone who is listening. This is done purposely to help
    with the flow of communication.

    Additional TAS Commands
    -----------------------

    +tas
          The basic command for using the TAS system
    +assist
          For backwards compatiblity. Another basic command for using the TAS system
    +bugs
          Shortcut: Lists the tasks in the 'Bugs' queue
    +ideas
          Shortcut: Lists the tasks in the 'Ideas' queue
    +typos
          Shortcut: Lists the tasks in the 'Typos' queue
    task '(task)
          Files a task directly into your task queue
          Otherwise into the generic 'Task' queue
    task (queue) '(task)
          Files task into specified queue

    TAS SubQueues
    -------------

    SubQueues are a way of organizing the evergrowing list of personal
    task queues and other queues that that are closely related to the
    parent queue.

    SubQueues are not listed in the complete list of queues as they are
    members of other queues but they are still listed in the main list
    of queues if they are not identified as a private queue.

    To use SubQueues, follow the simple steps below:

    +tas focus (queue)
          Sets your focus group
    +tas focus general
          Sets your focus back to the general queue list
    +tas slide (queue) (parent queue)
          Moves (queue) into (parent queue) as a subqueue
    +tas slide (queue) general
          Moves (queue) back into the General subqueue

    When you set your focus group and you list the queues, you will list
    the subqueues of that group. Queues that have subqueues are listed
    on the queue list with a * in the G column.

    Also See: +tas help (help|basic|task|list|queue|login|misc|chat|personal|commands|subqueues|all)

\-- Main.PeterCorless - 19 Nov 2004
