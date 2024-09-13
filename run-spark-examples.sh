#!/bin/bash
# Requirement: the user has to have the proper rights to write data to the log path, otherwise you get this error
#  "Failed to obtain delegation token for Log Aggregation Path
#  java.io.IOException: There is no mapped role for the group(s) associated with the authenticated user. (user: csso_mthomas)"
# Add the data required for the jobs (otherwise they fail)
#  hdfs://obs-mthomas-de-master0.obs-mtho.xcu2-8y8x.dev.cldr.work:8020/user/csso_mthomas/data/mllib/als/sample_movielens_ratings.txt
echo "Checking Kerberos token"
klist
while [[ $? -eq 1 ]]; do
    echo "Running kinit to create a Kerberos token"
    kinit
done

spark_version="3.5.2"
spark_tar="v${spark_version}.tar.gz"
if [ ! -f $spark_tar  ]; then
  wget https://github.com/apache/spark/archive/refs/tags/$spark_tar
  tar -xzf $spark_tar spark-$spark_version/data
  hdfs dfs -put spark-$spark_version/data /user/$USER
  tar -xzf $spark_tar spark-$spark_version/examples/src/main/resources
  hdfs dfs -put spark-$spark_version/examples /user/$USER
fi

# Run all the Java Spark examples
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaAFTSurvivalRegressionExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaALSExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaBinarizerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaBisectingKMeansExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaBucketedRandomProjectionLSHExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaBucketizerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaChiSqSelectorExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaChiSquareTestExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaCorrelationExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaCountVectorizerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaDCTExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaDecisionTreeClassificationExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaDecisionTreeRegressionExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaElementwiseProductExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaEstimatorTransformerParamExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaFMClassifierExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaFMRegressorExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaFPGrowthExample

spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaFeatureHasherExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaGaussianMixtureExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaGeneralizedLinearRegressionExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaGradientBoostedTreeClassifierExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaGradientBoostedTreeRegressorExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaImputerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaIndexToStringExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaInteractionExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaIsotonicRegressionExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaKMeansExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaLDAExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaLinearRegressionWithElasticNetExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaLinearSVCExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaLogisticRegressionSummaryExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaLogisticRegressionWithElasticNetExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaMaxAbsScalerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaMinHashLSHExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaMinMaxScalerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaModelSelectionViaCrossValidationExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaModelSelectionViaTrainValidationSplitExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaMulticlassLogisticRegressionWithElasticNetExample

spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaMultilayerPerceptronClassifierExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaNGramExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaNaiveBayesExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaNormalizerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaOneHotEncoderExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaOneVsRestExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaPCAExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaPipelineExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaPolynomialExpansionExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaPowerIterationClusteringExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaPrefixSpanExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaQuantileDiscretizerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaRFormulaExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaRandomForestClassifierExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaRandomForestRegressorExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaRobustScalerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaSQLTransformerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaStandardScalerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaStopWordsRemoverExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaStringIndexerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaSummarizerExample

spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaTfIdfExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaTokenizerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaUnivariateFeatureSelectorExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaVarianceThresholdSelectorExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaVectorAssemblerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaVectorIndexerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaVectorSizeHintExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaVectorSlicerExample &
spark3-submit run-example --deploy-mode=cluster --master=yarn ml.JavaWord2VecExample &

spark3-submit run-example --deploy-mode=cluster JavaPageRank data/mllib/pagerank_data.txt 100 &
spark3-submit run-example --deploy-mode=cluster JavaSparkPi 100 &
spark3-submit run-example --deploy-mode=cluster JavaTC 100 &


# Requires you have https://github.com/apache/spark.git cloned and you are in the spark directory
# So that the examples/src/main/resources/kv1.txt is availale
# Note this is a --deploy-mode="client"
pushd spark-$spark_version
spark3-submit run-example --deploy-mode=client sql.hive.SparkHiveExample
popd

# Python
# Use ps or pstree to see the "tree" of processes that Yarn creates to run Python scripts
#  ps -ef --forest | less
#  pstree
# Also use systemctl to see this relationship as well
#  systemctl status
pushd spark-$spark_version
spark3-submit --deploy-mode=cluster  examples/src/main/python/pi.py 100 &
spark3-submit --deploy-mode=cluster  examples/src/main/python/transitive_closure.py 20 &
