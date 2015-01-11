// eclipse
addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "2.5.0")

// ensime
resolvers += Resolver.sonatypeRepo("snapshots")

addSbtPlugin("org.ensime" % "ensime-sbt" % "0.1.5-SNAPSHOT")

// scalastyle
resolvers += "sonatype-releases" at "https://oss.sonatype.org/content/repositories/releases/"

addSbtPlugin("org.scalastyle" %% "scalastyle-sbt-plugin" % "0.6.0")
