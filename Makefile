.PHONY: regenerate-host-keys shell

regenerate-host-keys:
	docker build --tag mqsoh/nohubs .
	docker run --interactive --tty --rm --volume $$(pwd):/workdir --workdir /workdir mqsoh/nohubs regenerate-host-keys

# WARNING---------------------------------------------------------------WARNING
# Don't use the environment variables below. I use them in dev for testing. Use
# the regenerate-host-keys task to generate your own.
# WARNING---------------------------------------------------------------WARNING
shell:
	docker build --tag mqsoh/nohubs .
	docker run --interactive --tty --rm --volume $$(pwd):/workdir --workdir /workdir \
		--publish 22:22 \
		--publish 80:80 \
		--publish 9418:9418 \
		--env SELF_HOSTED=true \
		--env _etc_ssh_ssh_host_ecdsa_key=LS0tLS1CRUdJTiBFQyBQUklWQVRFIEtFWS0tLS0tCk1IY0NBUUVFSUljdC8xcjZxVTNJc3FqZllidUlCb0NPUTF6eC9MU0dhemViL1hrSHhHT1lvQW9HQ0NxR1NNNDkKQXdFSG9VUURRZ0FFRDlZbEFRenE3M3didHFlL0tpOE0vSjVoUHd2am9OcUZtYjBEajVkL1E1VmxiWm9jZHhUKwphN1pRb01iMjhpWk0zNTAzSzF3eXpNZmMyekF1cGt5UmlnPT0KLS0tLS1FTkQgRUMgUFJJVkFURSBLRVktLS0tLQo= \
		--env _etc_ssh_ssh_host_ecdsa_key_pub=ZWNkc2Etc2hhMi1uaXN0cDI1NiBBQUFBRTJWalpITmhMWE5vWVRJdGJtbHpkSEF5TlRZQUFBQUlibWx6ZEhBeU5UWUFBQUJCQkEvV0pRRU02dTk4RzdhbnZ5b3ZEUHllWVQ4TDQ2RGFoWm05QTQrWGYwT1ZaVzJhSEhjVS9tdTJVS0RHOXZJbVROK2ROeXRjTXN6SDNOc3dMcVpNa1lvPSByb290QDZmMzU2YzhiNmVjMAo= \
		--env _etc_ssh_ssh_host_ed25519_key=LS0tLS1CRUdJTiBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0KYjNCbGJuTnphQzFyWlhrdGRqRUFBQUFBQkc1dmJtVUFBQUFFYm05dVpRQUFBQUFBQUFBQkFBQUFNd0FBQUF0emMyZ3RaVwpReU5UVXhPUUFBQUNDVzlJVkdPNlRjYkY0dmU2WmVJU1pmUHB2K05OU01sMGNTVkw1NGsxV2ZxZ0FBQUpncWpocDNLbzRhCmR3QUFBQXR6YzJndFpXUXlOVFV4T1FBQUFDQ1c5SVZHTzZUY2JGNHZlNlplSVNaZlBwditOTlNNbDBjU1ZMNTRrMVdmcWcKQUFBRURSdXRBOUVSelBZUGc4VElHejJoL2lqVUQ3U2M1cUNXdnB6YTFKWUdjZ001YjBoVVk3cE54c1hpOTdwbDRoSmw4KwptLzQwMUl5WFJ4SlV2bmlUVlorcUFBQUFFWEp2YjNSQU5tWXpOVFpqT0dJMlpXTXdBUUlEQkE9PQotLS0tLUVORCBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0K \
		--env _etc_ssh_ssh_host_ed25519_key_pub=c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUpiMGhVWTdwTnhzWGk5N3BsNGhKbDgrbS80MDFJeVhSeEpVdm5pVFZaK3Egcm9vdEA2ZjM1NmM4YjZlYzAK \
		--env _etc_ssh_ssh_host_rsa_key=LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcFFJQkFBS0NBUUVBdHA5NGFoMCtoUlhHenVoZGxsZ2NJNjlFM0lVendpeHF3dnZSSTJyZnJlbzBONmRMCmh4N0UxTGU3QzAvclpzQzJCcEtBN24vbGJXUlRYcW1nclN1VUJ6Z3duYnJsei8yYytkTUhrUnNtMHZjRXBrT0oKeG9wcUE0UXRwYmxWNnlKU3hwK2IrMU5iMzE0UlVhcmJQR3lidDNCTXFKdndYUUNtcStLcm45aWVOL0p3aW5LNgpNZ1JSK0JuakNZcmkrbk1RVWpncm5iUmNweUxDZ3V6M0lzTHhrZ2JDTTZXdHNZUHljZ3B0WVF4cmJ2RTFZMW9yCmdFVGVEa3lKL244eStCOGNGR2Myb0I2OS9RalI0L3JES0JoNUpvcmVnSXNrT3dYSGU0dE5oNHdUWTNISnB3TFgKc3pZNnNGQlUxcERldGNqL3p2d05rNHJ4UTErcmVWL2JTckZyNHdJREFRQUJBb0lCQVFDdkRySzQxWXVtdXpjMgpBNXdpa0JkNVJYdDIvK0NiazBSTDRHT2IxY2pReDU2Q2NzVjlvc3IvTlpnQXdmMWZJLy9ZMFByeXBIcmluN2NqCkdPdEMxSEV6Y25OMzN6NklZQTNubEppK1NnNnZUOGFQTWxLUmxRRUdtZCsvNnFjbm5HRklzSnN2RWJzUnBQUnAKR3FUSmlUckRYc3k5RzY0UEdKNnNTYjVHbmJrYzJwTjdrbDB4MUNyRE92a2ZVdW9jckJaWXROOUgvZmRaOTVHSAo2eFJ0QVZzUkl0ZFRMMWg3WXpFQldXaUhRa1V1MlovcVBSTU9GT2dYckdvc0FqSVFJYVYvRE1FdXB0dlNubEVPCmk0d1lxeGloK1hvNHpnL25uZXNYV242VXpSTGV3OUZkczdiNk5mcytwYjdnUnVHM0RmWEZZdENkVDJkMzV6dXoKS2JqMEtKU1JBb0dCQU9yMUdWOHlUZ2lBKzF1a3kyNm9sL29TSTBCL3NIMUh1RkpkTUgrV2lOakc4YTlDdzlDZApiTmNKdFlYTXlrN2dUNk5HZXc3cC9mWWpuLy83WXRXSVpzVlNrSHR0NkJEZm95QThEb25wQ1VFMU96SlcyZjBUCnJLRWJvYkRXdjd3MG45ZmZVTEJSM2NDK0ZJcTVSSyszQ1dHNVliWXE4MDVKREpKeGlMTlVyM21IQW9HQkFNYjYKZmNaVmI3engvV240aGhLTHRrQzdxL0pDNDR0TUowNzRobzJpU2plZmJtVnZiTDI3QlNhbkFPazlNRHlkWHdmcgo5Nm1Sd1A0TXZTeUZpc1hjZFczSE0xS1RyZXpkeVN5Z3dhVTFhY0tGWTJrNXhWUll5WFJFYkp1REFUUHZTODJKCjlweDBtYVZrTU8xdnZuek5zL3Z0SUtkVHVtMEUrVXRmSXpnOHJhSEZBb0dCQUlZQ0ExV1RlSVJMSkpJUmZPSUIKa0tUVm9YdVJHSlZyeVlwWWttZkM4UXhLODkvVlFhQURtZWRRSjFOSUNYOVJXcnF5WVUrUlVBTUtNS0NzdmFNeQpxQU1WWTBpeTEvQi96U2QrZVlCWkJLbEhkaHJ4QkdYZXlkQWQxV3ZxSC9OMVJGRzRrZW51MTM2dUswTXdCaWYrClNvQ05YbGlyU0pnMis4K3VwNXc0eWRpVEFvR0FlSG40cDVyWllmemZaRWQrM2tITG94dyt1eHUyN0lPNmxUMHoKTXhTZGZWcENISmEvcjQxS1RDSDRFa0RqTVFCVUp0YkFDT0xnaUxJcjVJWWpCVFE3d2JGSUtPcVQ5NFErSjVCYQpUMjZzejRPMk1tTXhVS1hGckdrMW5WOVAzaU00c1lXa1ZRemdidHpnSnhOdXNlQlc1dVduek1pTWF6QUV4WmNnCkd3L2FUY1VDZ1lFQTVrMzdjQUlWZ1pMc2NUNVVDMWhZYlFHOTV6dlJhb1dpRXQvMnpEcWNzRmE4WHVlcngyZnoKenVrM21naWxMbitZUFJpK1F5c2hnWk85MWZGRWdWc0VBWG9LWVgrMm1nVDR1OXJoWVI0YmxMblk0SWJEVk1hNwpqbUx1b3dWU2d5cTE5MXNNYWVJaHJ0U3lRZ0VtSisxbG5JVm5YRHlEbmhUK1BYNm43YkdwblRnPQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo= \
		--env _etc_ssh_ssh_host_rsa_key_pub=c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCQVFDMm4zaHFIVDZGRmNiTzZGMldXQndqcjBUY2hUUENMR3JDKzlFamF0K3Q2alEzcDB1SEhzVFV0N3NMVCt0bXdMWUdrb0R1ZitWdFpGTmVxYUN0SzVRSE9EQ2R1dVhQL1p6NTB3ZVJHeWJTOXdTbVE0bkdpbW9EaEMybHVWWHJJbExHbjV2N1UxdmZYaEZScXRzOGJKdTNjRXlvbS9CZEFLYXI0cXVmMko0MzhuQ0tjcm95QkZINEdlTUppdUw2Y3hCU09DdWR0RnluSXNLQzdQY2l3dkdTQnNJenBhMnhnL0p5Q20xaERHdHU4VFZqV2l1QVJONE9USW4rZnpMNEh4d1VaemFnSHIzOUNOSGorc01vR0hrbWl0NkFpeVE3QmNkN2kwMkhqQk5qY2NtbkF0ZXpOanF3VUZUV2tONjF5UC9PL0EyVGl2RkRYNnQ1WDl0S3NXdmogcm9vdEA2ZjM1NmM4YjZlYzAK \
		--env AUTHORIZED_KEYS=c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCQVFETlYybVlWZ3ZVQStWSDJhcFptNkRtUmpyczAzOU1WL1BMSFRNbm4yT3ZqVjRLQVdBTG1MYnN3SUxJTG9Hb0dRT0Yvb3ltUWdNMkc0alY0QzE0azhKY1ZyOTBRT0k5V1BUaTloRjR2RGdmSDl4Zk92UXVRcUtUWTJEald4eHV4cnhvWElxczd6cTBGZ3duY3YvOERiMlpRNjZMNmc0M1N4TzlyYm9HWk5kejhhMkhablhyd01NY3NPT1pMSU41SE5qbjV2b0xZVDdlT2h2QUw1TzdRQTBvSXVWWE1tcGswdGMrdk9QK3ZpTHNVc0tPTnB2U09FazZXOFgrb3NWWkE2aE1aaGowbENhQTRRWThULzlpNmhvVVVESEZsMEtpclBRcEE4T0RjbUZyYWRpMWgxbkV6V0p4SjFpN0RhU1Zod0lIeHJEb0xmaitpdCtJY1U5QXhnSkIgbWFzb25Ac3RhdWdsZXIubmV0Cg== \
		mqsoh/nohubs \
		bash ./files/entrypoint.sh bash
