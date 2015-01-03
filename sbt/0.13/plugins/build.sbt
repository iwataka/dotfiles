// ensime
resolvers += Resolver.sonatypeRepo("snapshots")

addSbtPlugin("org.ensime" % "ensime-sbt" % "0.1.5-SNAPSHOT")

// scalastyle
addSbtPlugin("org.scalastyle" %% "scalastyle-sbt-plugin" % "0.6.0")

resolvers += "sonatype-releases" at "https://oss.sonatype.org/content/repositories/releases/"
