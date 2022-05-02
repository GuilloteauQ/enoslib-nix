import logging
import enoslib as en

logging.basicConfig(level=logging.INFO)

conf = (
    en.VagrantConf()
    .add_machine(
       roles=["master"],
       flavour="tiny",
       number=1
    )
    .add_machine(
       roles=["agent"],
       flavour="tiny",
       number=1
    )
    .add_network(
       roles=["mynetwork"],
       cidr="192.168.42.0/24"
    )
    .finalize()
)


provider = en.Vagrant(conf)
roles, networks = provider.init()

provider.destroy()
