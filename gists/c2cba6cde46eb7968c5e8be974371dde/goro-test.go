package main

import (
	"bytes"
	"os/exec"
	"strings"
	"syscall"
)

func runCommand(command string, commandPath string) (stdOut string, stdErr string, exitCode int) {
	commandArr := strings.Split(command, " ")
	cmd := exec.Command(commandPath, commandArr...)

	var outbuf, errbuf bytes.Buffer
	cmd.Stdout = &outbuf
	cmd.Stderr = &errbuf

	err := cmd.Run()
	stdOut = outbuf.String()
	stdErr = errbuf.String()

	if err != nil {
		if exitError, ok := err.(*exec.ExitError); ok {
			ws := exitError.Sys().(syscall.WaitStatus)
			exitCode = ws.ExitStatus()
		} else {
			if stdErr == "" {
				stdErr = err.Error()
			}
			exitCode = 1 // unable to get error code
		}
	} else {
		ws := cmd.ProcessState.Sys().(syscall.WaitStatus)
		exitCode = ws.ExitStatus()
	}

	return
}

func dosth(done chan bool) {
	println("Do sth")
	stdOut, _, _ := runCommand("rollout status deploymentconfig ruby-ex --watch", "/media/storage/home/gbraad/.minishift/cache/oc/v1.5.1/oc")
	println(stdOut)
	if strings.Contains(stdOut, "successfully rolled out") {
		println("Match")
		done <- true
	} else {
		print("Fail?")
		done <- false
	}
}

func main() {
	total := 10
	success := true
	done := make(chan bool, total)

	for i := 0; i < total; i++ {
		go dosth(done)
	}

	for i := 0; i < total; i++ {
		println("read", i)
		success = success && <-done
	}

	println("out:", success)
}
