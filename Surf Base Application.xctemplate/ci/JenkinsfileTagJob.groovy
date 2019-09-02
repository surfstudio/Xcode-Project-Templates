@Library('surf-lib@version-1.0.0-SNAPSHOT') // https://bitbucket.org/surfstudio/jenkins-pipeline-lib/
import ru.surfstudio.ci.pipeline.tag.TagPipelineiOS
import ru.surfstudio.ci.stage.StageStrategy

//init
def pipeline = new TagPipelineiOS(this)
pipeline.init()

//customization
pipeline.getStage(pipeline.BUILD).strategy = StageStrategy.SKIP_STAGE
pipeline.getStage(pipeline.UNIT_TEST).strategy = StageStrategy.SKIP_STAGE
pipeline.getStage(pipeline.INSTRUMENTATION_TEST).strategy = StageStrategy.SKIP_STAGE
pipeline.getStage(pipeline.STATIC_CODE_ANALYSIS).strategy = StageStrategy.SKIP_STAGE

//run
pipeline.run()