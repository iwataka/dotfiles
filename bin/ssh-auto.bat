@echo off
if not "%SSH_AGENT_PID%" == "" goto end
for /f "eol=; tokens=1,2 delims==;" %%1 in ('ssh-agent.exe') do (
 if "%%1" == "SSH_AUTH_SOCK" set SSH_AUTH_SOCK=%%2
 if "%%1" == "SSH_AGENT_PID" set SSH_AGENT_PID=%%2
)
ssh-add
:end
