@Library('surf-lib@version-1.0.0-SNAPSHOT') // https://bitbucket.org/surfstudio/jenkins-pipeline-lib/
import ru.surfstudio.ci.pipeline.pr.PrPipelineiOS
import ru.surfstudio.ci.stage.StageStrategy
import ru.surfstudio.ci.CommonUtil

//init
def pipeline = new PrPipelineiOS(this)
pipeline.init()

//customization
pipeline.getStage(pipeline.UNIT_TEST).body = {
	CommonUtil.shWithRuby(this, "make test")
	junit 'fastlane/test_output/report.junit'
	archiveArtifacts artifacts: 'fastlane/test_output/report.html'
}
pipeline.getStage(pipeline.UNIT_TEST).strategy = StageStrategy.FAIL_WHEN_STAGE_ERROR
pipeline.getStage(pipeline.INSTRUMENTATION_TEST).strategy = StageStrategy.SKIP_STAGE

//run
pipeline.run()